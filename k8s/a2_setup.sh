#!/bin/bash

echo "|===========================|"
echo "|  Creating cluster kind-1  |"
echo "|===========================|"
kind create cluster --name kind-1 --config ./kind/cluster-config.yaml
printf "\n\n"


echo "|===========================|"
echo "|     View cluster info     |"
echo "|===========================|"
kubectl cluster-info
printf "\n\n"



echo "|===========================|"
echo "|         View Nodes        |"
echo "|===========================|"
kubectl get nodes
printf "\n\n"


echo "|============================================|"
echo "|     Checking if nodes are Ingress-ready    |"
echo "|============================================|"
kubectl get nodes -L ingress-ready
printf "\n\n"


echo "|===============================|"
echo "|     Loading Image to Kind     |"
echo "|===============================|"
kind load docker-image node-web-app:v1 --name kind-1
printf "\n\n"


echo "|======================================|"
echo "|     Applying Deployment Manifest     |"
echo "|======================================|"
kubectl apply -f ./manifests/deployment.yaml
printf "\n\n"

echo Sleeping for 5s...
sleep 5


echo "|============================|"
echo "|     Viewing Deployment     |"
echo "|============================|"
kubectl get deploy
printf "\n\n"


echo "|=====================================|"
echo "|     Creating Ingress-Controller     |"
echo "|=====================================|"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
printf "\n\n"

echo Sleeping for 30s...
sleep 30


echo "|====================================|"
echo "|     Viewing Ingress-Controller     |"
echo "|====================================|"
kubectl -n ingress-nginx get deploy
printf "\n\n"


echo "|===================================|"
echo "|     Applying Service Manifest     |"
echo "|===================================|"
kubectl apply -f ./manifests/service.yaml 
printf "\n\n"

echo Sleeping for 5s...
sleep 5


echo "|=========================|"
echo "|     Viewing Service     |"
echo "|=========================|"
kubectl get svc
printf "\n\n"


echo "|===================================|"
echo "|     Applying Ingress Manifest     |"
echo "|===================================|"
kubectl apply -f ./manifests/ingress.yaml 
printf "\n\n"

echo Sleeping for 5s...
sleep 5


echo "|=========================|"
echo "|     Viewing Ingress     |"
echo "|=========================|"
kubectl get ingress
printf "\n\n"
