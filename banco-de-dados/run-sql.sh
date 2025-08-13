#!/bin/bash
../syenv.sh --env-file ./.env  && psql -h $DB_HOST -p $DB_PORT -U $DB_USER -w -d $DB_SCHEMA -f $1