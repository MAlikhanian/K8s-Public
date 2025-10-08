#!/bin/bash
# Debug commands for MongoDB ImagePullBackOff issue

echo "=== Checking MongoDB pod details ==="
kubectl describe pod -n librechat librechat-mongodb-c8ffcd456-2p4vb

echo -e "\n=== Checking MongoDB pod events ==="
kubectl get events -n librechat --field-selector involvedObject.name=librechat-mongodb-c8ffcd456-2p4vb --sort-by=.lastTimestamp

echo -e "\n=== Checking all MongoDB pods ==="
kubectl get pods -n librechat -l app.kubernetes.io/name=mongodb -o wide

echo -e "\n=== Checking docker-secret ==="
kubectl get secret -n librechat docker-secret -o yaml

echo -e "\n=== Checking MongoDB deployment/statefulset config ==="
kubectl get deployment -n librechat -o yaml | grep -A 20 mongodb

echo -e "\n=== Recent events in namespace ==="
kubectl get events -n librechat --sort-by=.lastTimestamp | tail -20
