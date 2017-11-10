#! /bin/bash
# Tag, Push and Deploy only if it's not a pull request
# Comment
source ./bin/env-kube.sh

docker push "$DOCKER_REPO"/"$DOCKER_WEB_IMAGE":latest

mkdir ${HOME}/.kube
cp cluster-cfg ${HOME}/.kube/config
kubectl config set clusters.uswest2.billm.foo.today.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
kubectl config set users.uswest2.bill.foo.today.client-certificate-data "$KUBE_CLIENT_CERTIFICATE"
kubectl config set users.uswest2.bill.foo.today.client-key-data "$KUBE_CLIENT_KEY"

kubectl create -f web-claim0-persistentvolumeclaim.json
kubectl create -f web-deployment.json
kubectl create -f web-service.json
