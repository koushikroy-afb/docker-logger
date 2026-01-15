#!/bin/bash

echo "Building Docker image"
docker build --platform linux/amd64 -t ecs-logger .

echo "Logging into AWS ECR"
aws ecr get-login-password --region eu-north-1 | \
docker login --username AWS --password-stdin 838838622972.dkr.ecr.eu-north-1.amazonaws.com/mylogger

echo "Tagging image"
docker tag ecs-logger:latest 838838622972.dkr.ecr.eu-north-1.amazonaws.com/mylogger:latest

echo "Pushing image to ECR"
docker push 838838622972.dkr.ecr.eu-north-1.amazonaws.com/mylogger:latest

echo "Deployment successful"

