#!/usr/bin/env bash
# Download, Install and Configure ecs-cli
#Some txt

#set the environment variables
source ./bin/env.sh

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
