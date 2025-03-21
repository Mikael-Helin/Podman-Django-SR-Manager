#!/bin/bash

CONTAINER_NAME=django-sr
DB_FILE=db.sqlite3
MODE=$1  # "in" or "out"

if [ "$MODE" == "in" ]; then
  podman cp $DB_FILE $CONTAINER_NAME:/opt/app/$DB_FILE
  echo "Copied $DB_FILE into container."
elif [ "$MODE" == "out" ]; then
  podman cp $CONTAINER_NAME:/opt/app/$DB_FILE $DB_FILE
  echo "Copied $DB_FILE out of container."
else
  echo "Usage: ./sqlite.sh [in|out]"
fi