#!/bin/bash

CONTAINER_NAME=django-sr

podman stop $CONTAINER_NAME
podman rm $CONTAINER_NAME