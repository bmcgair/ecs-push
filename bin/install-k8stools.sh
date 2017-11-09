#!/usr/bin/env bash
# Download, Install and Configure ecs-cli
#Some txt

#set the environment variables
source ./bin/env.sh
source ./bin/env-kube.sh

rm -rf ~/.ecs/config

#Download the correct cli for your os
if [ "$(uname)" == "Darwin" ]; then
  # Get the Mac binaries
  curl -L https://github.com/kubernetes-incubator/kompose/releases/download/v0.7.0/kompose-darwin-amd64 -o kompose
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
 sudo curl -L https://github.com/kubernetes-incubator/kompose/releases/download/v0.7.0/kompose-linux-amd64 -o kompose

fi
sudo mv ./kompose /usr/local/bin/kompose
sudo chmod +x /usr/local/bin/kompose

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl

# install kops
wget https://github.com/kubernetes/kops/releases/download/1.7.0/kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
sudo chmod +x kops-linux-amd64
