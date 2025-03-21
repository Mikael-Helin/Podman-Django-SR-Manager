#!/bin/bash

# Variables
IMAGE_NAME=django-sr-manager
GIT_REPO="git@github.com:Mikael-Helin/Django-SR-Manager.git"

# Clone only if missing, else pull
if [ ! -d srmanager ]; then
  git clone $GIT_REPO srmanager
else
  cd srmanager && git pull && cd ..
fi

# Build the Podman image using context
podman build -t $IMAGE_NAME -f Dockerfile .
