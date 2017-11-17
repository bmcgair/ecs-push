#! /bin/bash
# Tag, Push and Deploy only if it's not a pull request
# Comment
source ./bin/env-kube.sh

docker commit 
docker login --username "$DOCKER_REPO" --password "$DOCKER_PASSWORD"
docker push "$DOCKER_REPO"/"$DOCKER_WEB_IMAGE":latest
docker tag  "$DOCKER_REPO"/"$DOCKER_WEB_IMAGE":latest "$DOCKER_REPO"/"$DOCKER_WEB_IMAGE":"$TRAVIS_COMMIT"

mkdir ${HOME}/.kube
cp cluster-cfg ${HOME}/.kube/config
kubectl config set clusters.uswest2a.billm.foo.today.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
kubectl config set users.uswest2a.bill.foo.today.client-certificate-data "$KUBE_CLIENT_CERTIFICATE"
kubectl config set users.uswest2a.bill.foo.today.client-key-data "$KUBE_CLIENT_KEY"

kubectl --insecure-skip-tls-verify=true set image deployment/fooweb2 fooweb2=bmcgair/django-web:"$TRAVIS_COMMIT"
