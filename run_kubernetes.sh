#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="piushvaish/mlapp"
# Step 2
# Run the Docker Hub container with kubernetes
kubectl run mlappapi\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=5000 --labels app=mlappapi


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward mlappapi 5000:5000

