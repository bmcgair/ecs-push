#! /bin/bash
# Tag, Push and Deploy only if it's not a pull request
# Comment
source ./bin/env-kube.sh

#if [ "$TRAVIS_BRANCH" == "master" ]; then
    docker login --username "$DOCKER_USERNAME" --password "$DOCKER_PASSWORD"
    docker push "$DOCKER_REPO"/"$DOCKER_WEB_IMAGE":latest
    kops import cluster --name uswest2.bill.foo.today --region us-west-2 --state=$KOPS_STATE_STORE
    kubectl create -f web-deployment.json
    kubectl create -f web-service.json
#    ecs-cli compose --project-name "$ECS_PROJECT" --file ecs-deploy.yml service up;
#fi
