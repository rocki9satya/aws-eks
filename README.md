# AWS EKS Final Project — Events App (Node.js + MySQL)

This project is a simple RESTful backend API built using **Node.js** and **Express**, with **MySQL** as the data store. It serves event data and demonstrates deployment-ready microservice architecture for AWS EKS.

---

## Technology Stack

- Node.js (Express.js)
- MySQL
- Docker
- Kubernetes (kubectl)
- eksctl
- Terraform
- Helm
- Git

---

## Prerequisites

Make sure you're running **Amazon Linux 2** or an equivalent Linux distribution.

### Install All Dependencies

To install Docker, Kubernetes CLI (`kubectl`), `eksctl`, Git, Node.js, Terraform, and Helm:

```bash
chmod +x install_prereq.sh
./install_prereq.sh
```
## For Final Project Refer eventsappstart folder having evets-api and events-app.

## For Capstone Project Please refer the node-postgres-app-helm and the documentation as below




# Node.js + PostgreSQL Application on Kubernetes with Helm

## Overview
This project demonstrates how to containerize a Node.js application with a PostgreSQL backend, push the images to a container registry, deploy them on a Kubernetes cluster using Helm, and perform rolling updates.

---

## Prerequisites

- Kubernetes cluster (e.g., Amazon EKS, Minikube, or any managed Kubernetes)
- `kubectl` installed and configured to access the cluster
- `helm` installed
- Docker installed and logged in to your container registry (Docker Hub, ECR, etc.)
- Basic familiarity with Kubernetes resources and Helm charts

---

## Folder Structure
```
node-postgres-app-helm/
├── charts/
│ └── myapp-chart/
│ ├── templates/
│ │ ├── deployment.yaml
│ │ ├── service.yaml
│ │ ├── postgres.yaml
│ │ └── postgres-service.yaml
│ ├── Chart.yaml
│ └── values.yaml
├── app.js
├── package.json
├── Dockerfile
├── docker-compose.yaml
└── README.md

```


---

## Steps to run the application

### 1. Build and push Docker image

```bash
docker build -t <your-dockerhub-username>/node-postgres-app:latest .
docker push <your-dockerhub-username>/node-postgres-app:latest
```

### 2. Create or use existing Kubernetes cluster

If you are using Amazon EKS, create your cluster with eksctl or through AWS Console. For other environments, set up your cluster accordingly.
```bash
eksctl create cluster -f cluster.yaml
```
Verify access:
### 3. Configure kubectl to use your cluster

```bash

kubectl get nodes
```

### 4. Deploy the Helm chart

Navigate to the Helm chart directory and install the release:
```bash
helm install myapp ./myapp
```

Check pods and services:
```bash
kubectl get pods
kubectl get svc
```
### 5. Access the application

    Obtain the external LoadBalancer IP or hostname from the service.

    Open your browser to the service endpoint on the configured port.

### Performing Rolling Updates

    Update your application code.

    Build and push a new Docker image with a new tag:

docker build -t <your-dockerhub-username>/node-postgres-app:v2 .
docker push <your-dockerhub-username>/node-postgres-app:v2

    Update the values.yaml file to use the new image tag v2.

    Upgrade the Helm release:

helm upgrade myapp ./node-postgres-app-helm/myaapp-chart
kubectl rollout status deployment/myapp

### 6 Debugging Tips

    View logs of a pod:

kubectl logs <pod-name>

    Describe a pod to get detailed info:

kubectl describe pod <pod-name>

    Check service endpoints to verify backend pods are selected correctly:

kubectl get endpoints

    Verify DNS resolution inside your pod:

kubectl exec -it <pod-name> -- nslookup <postgres-service-name>

    Common issues:

        Cannot connect to PostgreSQL
        Ensure PostgreSQL pod is running and service selectors match the PostgreSQL pod labels exactly. Confirm environment variables in your app deployment for database connection are correct.

        Service Endpoints show <none>
        Usually indicates selector mismatch between Service and Deployment. Double-check labels and selectors.

Notes

    This setup uses ephemeral storage for PostgreSQL data (emptyDir). For production, replace with persistent volumes.

    Service names and labels must be consistent to enable service discovery and DNS resolution.

    Both application and database run in the same Kubernetes namespace by default.









