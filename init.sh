#!/bin/bash

echo "Creating 'db_init' folder and generating SQL schema..."
[ ! -d "./db_init" ] && mkdir ./db_init
docker run --rm guacamole/guacamole \
  sh -c "/opt/guacamole/bin/initdb.sh --postgresql" \
  > ./db_init/initdb.sql
echo "Schema file 'initdb.sql' created."

# echo "Creating 'drive' folder and setting permissions..."
# mkdir -p ./drive
# find ./drive -type d -exec chmod 777 {} +
# echo "'drive' folder is ready."
chmod +x ./db_init/initdb.sql
echo "Schema file 'initdb.sql' created and made executable."
echo "Creating 'record' folder and setting permissions..."
mkdir -p ./record
find ./record -type d -exec chmod 777 {} +
echo "'record' folder is ready."
# echo "Creating 'data' folder and setting permissions..."
# mkdir -p ./data
# find ./data -type d -exec chmod 777 {} +
# echo "'data' folder is ready."
