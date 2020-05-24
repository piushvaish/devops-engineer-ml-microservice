#!/usr/bin/env bash
# Step 1:
# Build image and add a descriptive tag
docker build -f Dockerfile . -t mlapp --label mlapp
# Step 2: 
# List docker images
docker image ls --filter label=mlapp
# Step 3: 
# Run flask app
docker run -it -p 5000:5000 mlapp
