#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "gitpython",
#     "google-cloud-firestore",
#     "structlog",
# ]
# ///

import argparse
import structlog
import sys
import traceback
import platform
from datetime import datetime, UTC
from importlib.metadata import distributions
from google.cloud import firestore
from git import Repo

logging = structlog.get_logger()

def log_uncaught_exceptions(exc_type, exc_value, exc_traceback):
    """catches unhandled exceptions and logs them"""

    if issubclass(exc_type, KeyboardInterrupt):
        sys.__excepthook__(exc_type, exc_value, exc_traceback)
        return

    logging.critical("Exception", exc_info=(exc_type, exc_value, exc_traceback))
    logging.critical(
        "Unhandled Exception {0}: {1}".format(exc_type, exc_value),
        extra={"exception": "".join(traceback.format_tb(exc_traceback))},
    )


def details() -> str:
    """return details about python version and platform as a dict"""

    platform_details = {
        "python_version": sys.version,
        "platform": sys.platform,
        "platform_details": platform.platform(),
    }

    installed_packages = [(dist.metadata["Name"], dist.version) for dist in distributions()]
    for package in installed_packages:
        platform_details[package[0]] = package[1]

    return platform_details


def str2bool(value: str) -> bool:
    """ converts strings representing truth to bool """ ""
    return value.lower() in ("yes", "true", "t", "1")


def deployed() -> int:
    """deployed function"""
    logging.info(f"details={details()}")

    platform_details = details()
    for key in platform_details.keys():
        logging.info(f"{key}: {platform_details[key]}")

    #if not os.path.exists(f"{path}/.git"):
    #    print(f"Path {path} is not a git repository")
    #    return 1

    repo = Repo('../../../../')
    print(f"working_dir: {repo.working_dir}")
    default_branch = repo.git.symbolic_ref('refs/remotes/origin/HEAD').split('/')[-1]
    print(f"default_branch: {default_branch}")
    print(f"active_branch: {repo.active_branch}")
    head_commit = repo.git.rev_parse(default_branch)

    db = firestore.Client()

    doc_ref = db.collection("deployments").document(head_commit)
    doc_ref.set({
        "action": "Deployed", 
        "date": str(datetime.now(UTC)),
        "commit": head_commit
    })

    return 0


def main() -> int:
    """
    main function

    returns 0 on success, 1 on failure

    configures logging and processes command line arguments
    """
    sys.excepthook = log_uncaught_exceptions

    parser = argparse.ArgumentParser(description="Firestore deployment script")
    parser.add_argument("--deployed", dest="deployed", action="store_true")
    args = parser.parse_args()

    success = 0
    if args.deployed:
        success = deployed()
    else:
        parser.print_help()

    return success


if __name__ == "__main__":
    # print(f"Enter {__name__}")
    exit(main())

