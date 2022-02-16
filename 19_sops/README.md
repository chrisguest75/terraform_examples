# README

Demonstrate how to use SOPS to keep data encrypted  

Refer to [sysadmin_examples/18_sops](https://github.com/chrisguest75/sysadmin_examples/blob/master/18_sops/README.md)  

## Install sops

```sh
brew install sops

# show version
sops -v  
```

## Install gpg

Instal gpg tooling

```sh
brew install gpg            
gpg --version       

# compare to latest
open https://www.gnupg.org/download/
```

## Create

The example pulls in an encrypted json file and writes out a decrypted file.  

```sh
# import - password testsops
gpg --import CFFEEF8F8B3A37DDB55A93EDAF13B1278CE67B02.pgp.key

# init
terraform init

# plan - will not work without key
terraform plan

# create state
terraform apply -auto-approve

# show decrypted state
terraform show -json | jq   
```

## Create gpg key

Create the gpg locally [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

```sh
# check if you have a key already
gpg --list-secret-keys --keyid-format=long  

# generate a key - use noreply chrisguest75@users.noreply.github.com
# enter a passphrase
gpg --full-generate-key         
# for older versions
gpg --default-new-key-algo rsa4096 --gen-key

# answers
> (1) RSA and RSA
> What keysize do you want? (3072) 4096
> Real name: SOPS Test
> Email address: sops@mysopstest.com
> Comment: Testing SOPS
> You selected this USER-ID:
>    "SOPS Test (Testing SOPS) <sops@mysopstest.com>"
> password: testsops

# see generated keys
gpg --list-secret-keys --keyid-format=long  

# export the key in armor format
gpg --armor --export XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## Encryption

```sh
# set key thumbprint
export SOPS_PGP_FP="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 

# encrypt
sops -e ./my_secrets.json  
sops -e ./my_secrets.json > ./my_secrets.enc.json    
```

## Decryption

```sh
# if you have a password on the pgp key
gpg-agent
GPG_TTY=$(tty)                                     
export GPG_TTY

# now decrypt
sops -d ./my_secrets.enc.json  
```

## Export keys

```sh
gpg --export-secret-keys "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" > XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pgp.key
```

## Clean keys

```sh
unset SOPS_PGP_FP 
gpg --delete-secret-keys "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
```

## Resources

* SOPS: Secrets OPerationS [here](https://github.com/mozilla/sops)
* carlpett/terraform-provider-sops [repo](https://github.com/carlpett/terraform-provider-sops)
* GPG: Extract private key and import on different machine [here](https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine)  
