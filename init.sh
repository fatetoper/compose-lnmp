#!/bin/sh
# docker-compose up -d
cd wwwroot/server && npm install && cd ../.. && docker-compose up -d