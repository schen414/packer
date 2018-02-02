#!/bin/bash
set -o xtrace
set -o errexit

AMI="ami-97785bed"

packer validate \
    -var "source_ami=$AMI" \
    -var-file="packer/variables.json" \
    packer/ec2-server.json

packer build \
    -var "source_ami=$AMI" \
    -var-file="packer/variables.json" \
    packer/ec2-server.json
    -debug