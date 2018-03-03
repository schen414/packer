#!/bin/bash
set -o xtrace
set -o errexit

VAULT_PASS_FILE="/tmp/vaultpass.txt"

packer validate \
    -var "vault-password-file=$VAULT_PASS_FILE" \
    -var-file="packer/centos7-vars.json" \
    packer/centos7.json

packer build \
    -var "vault-password-file=$VAULT_PASS_FILE" \
    -var-file="packer/centos7-vars.json" \
    packer/centos7.json
