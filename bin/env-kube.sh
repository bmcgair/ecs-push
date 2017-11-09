#! /bin/bash
# Setup Project Specfics - No Secrets
export KOPS_STATE_STORE=s3://clusters.bill.foo.today
export AWS_KEY_PAIR=class-private
export DOCKER_REPO=bmcgair
export DOCKER_WEB_IMAGE=django-web
