#!/bin/sh
cd wwwroot/server && npm install --registry=https://registry.npm.taobao.org  && cd ../.. && docker-compose up -d