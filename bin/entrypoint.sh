#!/usr/bin/env bash

set -ev

python manage.py migrate


# Run server.
python manage.py runserver 0.0.0.0:7000
# gunicorn \
# --workers 1 \
# --threads 2 \
# --max-requests 200 \
# --bind 0.0.0.0:7000 \
# greetings.wsgi:application
