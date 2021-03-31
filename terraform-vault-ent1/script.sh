#!/bin/bash

# download the binary
wget -c https://releases.hashicorp.com/vault/1.7.0-rc2+ent/vault_1.7.0-rc2+ent_linux_amd64.zip

# unzip the package
unzip vault_1.7.0-rc2+ent_linux_amd64.zip

# mv the binary to usr/local/bin
mv vault /usr/local/bin 
