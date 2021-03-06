#!/bin/bash

if [ "$ENV" = "DEV" ]; then
	echo "Running in dev mode"
	exec python /app/identidock.py
elif [ "$ENV" = "UNIT" ]; then
	echo "Running Unit Tests"
	exec python "tests.py"
else
	echo "Running in production mode"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py \
--callable app --stats 0.0.0.0:9191
fi
