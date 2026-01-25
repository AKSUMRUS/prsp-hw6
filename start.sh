#!/bin/bash
# minikube delete --all --purge
# запуск бд
docker compose up -d

minikube start
minikube addons enable ingress
minikube addons enable metrics-server

# docker network create minikube

sleep 10

# Добавляю prometheus CRD
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.68.0/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml

sudo sh -c 'echo "192.168.49.2 muffin-wallet.local" >> /etc/hosts'

helmfile sync

cd prometheus && docker compose up -d && cd ..