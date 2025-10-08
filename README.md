# Kubernetes YAML Configurations

This repository contains Kubernetes and Helm configuration files for various deployments.

## Contents

- `librechat.yaml` - Helm values file for LibreChat deployment on Kubernetes

## LibreChat Configuration

The `librechat.yaml` file contains configuration for deploying LibreChat on Kubernetes with the following features:

- **Storage**: Configured to use Ceph block storage
- **Ingress**: HAProxy ingress with Let's Encrypt TLS certificates
- **Domain**: chat.sebaoffice.ir
- **Components**:
  - LibreChat application
  - MongoDB database
  - Meilisearch for search functionality
- **Security**: Configured to use Kubernetes secrets for sensitive credentials

### Important Security Notes

⚠️ **Required Secrets**: Before deploying, you must create a Kubernetes secret named `librechat-credentials-env` with the following keys:
- `CREDS_KEY`
- `CREDS_IV`
- `JWT_SECRET`
- `JWT_REFRESH_SECRET`
- `MEILI_MASTER_KEY`
- `OPENAI_API_KEY` (or your preferred AI provider API key)

### Usage

Deploy using Helm:

```bash
helm install librechat ./path-to-chart -f librechat.yaml
```

Or upgrade existing deployment:

```bash
helm upgrade librechat ./path-to-chart -f librechat.yaml
```

## Custom Registry

This configuration uses a custom Docker registry at `docker.sebaoffice.ir` for container images.

## Contributing

Feel free to add more Kubernetes configurations and YAML files to this repository for future use.

## License

This repository is for personal/organizational use.
