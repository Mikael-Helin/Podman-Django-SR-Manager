#!/bin/bash
cd /opt/app

# Activate virtual environment
. venv/bin/activate

# Run Django migrations
python3 srmanager/manage.py migrate

# Optional: collect static files
# ./venv/bin/python srmanager/manage.py collectstatic --noinput

# Run dev server
python3 srmanager/manage.py runserver 0.0.0.0:8000
