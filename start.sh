CONTAINER_NAME=django-sr
IMAGE_NAME=django-sr-manager

# Ensure db.sqlite3 exists if you want to mount it
[ -f db.sqlite3 ] || touch db.sqlite3

# Give container full access to db.sqlite3
chmod 777 db.sqlite3

podman run -d \
  --name $CONTAINER_NAME \
  -p 8000:8000 \
  -v "$(pwd)/db.sqlite3:/opt/app/db.sqlite3" \
  $IMAGE_NAME