# WSO2-APIM-K8-Deployment

This repository contains guides and configuration files for deploying WSO2 API Manager on Kubernetes using Minikube. It includes configurations to connect WSO2 API Manager with a MySQL server and use NGINX Ingress Controller for accessing the WSO2 API Manager.

![](https://github.com/csdgurugegit/projectimages/blob/main/WSO2-APIM-K8-Deployment-Update.jpg)

## Setting Up Kubernetes (Minikube)

Start Minikube.

```bash
minikube start --driver=virtualbox
```

Drivers | minikube

https://minikube.sigs.k8s.io/docs/drivers/

Enable Nginx-Ingress controller in Minikube.

```bash
minikube addons enable ingress
```

Set up Ingress on Minikube with the NGINX Ingress Controller

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

## Build

Create two public repositories to push MySQL and WSO2-APIM image builds. Also, generate an access token for DockerHub usage.

Build MySQL and WSO2-APIM images and push them to DockerHub.

```bash
sh build-config.sh
```

## Deploy

Set files and permissions correctly. Ensure that the files have execute permission for the current user.

```bash
sh kubectl-apply.sh
```

##### To view and find resources.

kubectl Quick Reference

https://kubernetes.io/docs/reference/kubectl/quick-reference/
