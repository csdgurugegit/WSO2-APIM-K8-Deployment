#!/bin/bash

# Start Minikube with the VirtualBox driver, or follow another option of your choice.
# Configure kubectl correctly.
# Set user permissions. Ensure the user has execute permission.

kubectl apply -f ./mysql-server/secret/mysql-secret.yaml -f ./mysql-server/mysql-deployment.yaml -f ./mysql-server/mysql-service.yaml
kubectl apply -f ./wso2-apim/apim-configmap.yaml -f ./wso2-apim/apim-deployment.yaml -f ./wso2-apim/apim-service.yaml

#kubectl apply -f ./nginx-ingress/secret/tls-secret.yaml
kubectl apply -f ./nginx-ingress/ingress-service.yaml -f ./nginx-ingress/ingress-service-gw.yaml