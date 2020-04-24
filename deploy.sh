#!/bin/bash

echo "Creating the namespace..."

kubectl create namespace 5elementsofai


echo "Creating the volume..."

kubectl apply -f ./database/volume.yml
kubectl apply -f ./database/volume-claim.yml


echo "Creating the database credentials..."

kubectl apply -f ./database/secret.yml


echo "Creating the postgres deployment and service..."

kubectl create -f ./database/deployment.yml
kubectl create -f ./database/service.yml



echo "Creating the flask deployment and service..."

kubectl create -f ./backend/deployment.yml
kubectl create -f ./backend/service.yml
kubectl create -f ./backend/ingress.yml


echo "Adding the ingress..."

kubectl apply -f ./ingress/deployment.yml
kubectl apply -f ./ingress/service.yml


echo "Creating the vue deployment and service..."

kubectl create -f ./app/deployment.yml
kubectl create -f ./app/service.yml
kubectl create -f ./app/ingress.yml
