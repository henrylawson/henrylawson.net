#!/bin/bash
set -xeuo pipefail

DIR=$( cd $(dirname $0) ; pwd -P )
TERRAFORM_COMMANDS=$@
ROOT_DIR=$DIR/..
TERRAFORM_CREDS=$ROOT_DIR/infra/creds.tfvars.key

cd $ROOT_DIR/infra

terraform remote config \
  -backend=s3 \
  -backend-config="bucket=henrylawson.net-terraform-state-production" \
  -backend-config="key=henrylawson.net/terraform.tfstate" \
  -backend-config="region=us-east-1"

terraform $TERRAFORM_COMMANDS \
  -var-file="$TERRAFORM_CREDS"
