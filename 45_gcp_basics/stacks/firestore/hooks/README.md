# UV SCRIPT

The simplest way to write complex code with dependencies for scripting tools.  

## Running

```sh
./template.py
```

## Create a template

```sh
uv init --script template.py --python 3.12
```

## Add shebang

```sh
#!/usr/bin/env -S uv run --script

chmod +x ./template.py 
```

## Dependencies

```sh
uv run --with structlog rich template.py

uv add --script template.py 'structlog' 'rich'
```

## Resources

* https://docs.astral.sh/uv/guides/scripts/#running-a-script-with-dependencies
