#!/bin/bash

cd /repo/Sparta-App

export DB_HOST="mongodb://${DB_IP}:27017/posts"

pm2 start app.js

