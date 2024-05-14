#!/bin/bash

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh'chmod +x build.sh'
    sh'./build.sh'

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u rkmctwo1 -p $DOCKER_PASSWORD

  
    # Tag the image
    docker tag react-nginx rkmctwo1/dev

    # Push the image to the Dev Docker Hub repository
    docker push rkmctwo1/dev

elif [[ $GIT_BRANCH == "origin/prod" ]]; then
    # Build your project
    sh'chmod +x build.sh'
    sh'./build.sh'

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u rkmctwo1 -p $DOCKER_PASSWORD

   
    # Tag the image
    docker tag react-nginx rkmctwo1/prod 

    # Push the image to the Prod Docker Hub repository
    docker push rkmctwo1/prod
fi
