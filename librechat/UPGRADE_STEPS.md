# LibreChat Deployment Fix - Upgrade Steps

## Issues Fixed
1. ✅ MongoDB tag updated from `8.0.13-debian-12-r0` (non-existent) to `latest` (MongoDB 8.2.1)
2. ✅ Added `imagePullSecrets` for all components to authenticate with `docker.sebaoffice.ir`

## Changes Made to librechat.yaml

### 1. Main LibreChat Image
```yaml
imagePullSecrets:
  - name: docker-secret
```

### 2. MongoDB Configuration
```yaml
mongodb:
  imagePullSecrets:
    - docker-secret
  image:
    tag: latest  # Changed from 8.0.13-debian-12-r0
```

### 3. Meilisearch Configuration
```yaml
meilisearch:
  imagePullSecrets:
    - docker-secret
```

## Upgrade Commands

Run these commands on your Kubernetes control plane node:

```bash
# Navigate to your repo directory
cd ~/K8sYAMLRepo/librechat

# Verify the docker-secret exists
kubectl get secret -n librechat docker-secret

# If the secret doesn't exist, create it:
# kubectl create secret docker-registry docker-secret \
#   --docker-server=docker.sebaoffice.ir \
#   --docker-username=YOUR_USERNAME \
#   --docker-password=YOUR_PASSWORD \
#   --namespace librechat

# Upgrade the Helm release with updated values
helm upgrade librechat oci://ghcr.io/danny-avila/librechat-chart/librechat \
  -n librechat \
  -f librechat.yaml

# Watch the pods come up
kubectl get pods -n librechat -w

# Check events for troubleshooting
kubectl get events -n librechat --sort-by=.lastTimestamp | tail -30
```

## Expected Results

After upgrade, you should see:
- ✅ MongoDB pods pulling images successfully
- ✅ LibreChat pods pulling images successfully  
- ✅ All pods transitioning to `Running` state
- ✅ No more `ImagePullBackOff` or `ErrImagePull` errors

## Cleanup Old Pods (if needed)

If old pods are stuck, you can force delete them:

```bash
# Delete pods with ImagePullBackOff
kubectl delete pod -n librechat librechat-mongodb-5fd4bb5748-cmkjz
kubectl delete pod -n librechat librechat-librechat-6b665c8458-jjqb4

# Or delete all pods to force recreation
kubectl delete pod -n librechat --all
```

## Verification

```bash
# Check all pods are running
kubectl get pods -n librechat

# Check MongoDB is ready
kubectl logs -n librechat -l app.kubernetes.io/name=mongodb --tail=50

# Check LibreChat is ready
kubectl logs -n librechat -l app.kubernetes.io/name=librechat --tail=50

# Test the application
curl -k https://chat.sebaoffice.ir/health
```
