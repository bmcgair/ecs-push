#!/bin/bash
ecs-cli up \
  --keypair class-public \
  --capability-iam \
  --size 1 \
  --instance-type t2.small  \
  --port 8000 \
