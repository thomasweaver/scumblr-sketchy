#!/bin/bash

export C_FORCE_ROOT="true"
cd /app/
ls -l 
source sketchenv/bin/activate
redis-server &

celery -A sketchy.celery worker >> logs/celery.log 2>&1 &

python manage.py runserver --host 0.0.0.0 --port 8000 >> logs/manager.log 2>&1
