#!/bin/bash

docker compose down
#docker volume remove r5a10_couchdb
#docker volume remove r5a10_neo4j
#docker volume remove r5a10_neo4j_logs
docker volume remove r5a10_ferretdb
docker volume remove r5a10_postgresql

docker compose up -d #--build
