# A small Oracle Cloud environment with managing of terraform

## Description

I had a curiosity about what is Oracle Cloud and how I can manage it with terraform.  So, here is an experiment with this of mine.

Here is a small sample which creates a minimal infra (e.g. VCN, subnets, security lists, DHCP, etc) to provide the ability to run virtual machines.
Also, here is described a Bucket of Object Storage to storing state of terraform and one Compute Instance in Free Tier.

## How to configure an environment

Here is a `Pipfile` and `Pipfile.lock` which are to help in creating and configuring a working environment with a python and a virtualenv.

It's a just one command for all:
```bash
PIPENV_VENV_IN_PROJECT=1 pipenv sync
```

After that this command will be executed, a virtual environment and additional packages will be installed and ready to use.

## OCI, oci-cli and its config

All up to dated information about what is OCI, oci-cli and how it can be configured can be found there:
* https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm
* https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliconfigure.htm

## How to issue a token for terraform

Just run the next command:
```bash
PIPENV_VENV_IN_PROJECT=1 pipenv run oci session authenticate --profile-name terraform
```
After this your `~/.oci/config` file will contain a profile named `terraform` and current terraform module will use this profile to manage your Oracle Cloud.

## Use to your own

The next variables and fields have to be changed:
  - variable `compartment_ocid`
  - variable `defined_tags`
  - variable `ssh_pub_key`
  - backend "s3" `endpoint`

## Using Object Storage for storing terraform state file

All needed information is posted there - https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformUsingObjectStore.htm

Just pay attention to these things:
- the location of S3 credentials from default `~/.aws/credentials` has to be overridden to the `~/.oci/s3-creds` but still the `default` profile is used
- the `endpoint` in the `providers.tf` has to be set up to your endpoint
