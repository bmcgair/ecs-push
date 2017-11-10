#!/usr/bin/env bash
# Download, Install and Configure ecs-cli
#Some txt

#set the environment variables
source ./bin/env-kube.sh

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
