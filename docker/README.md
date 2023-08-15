# Security Chroma In Docker

## Prerequisites

- Docker
- bash
- openssl

## Setup

To generate the certificate and basic auth credentials:

```bash
bash setup.sh
```

The script with generate a self-signed certificate and basic auth credentials. All will be placed in `auth` directory.

Environment variables:

- CHROMA_DOMAIN: The domain name for the certificate. Default: localhost
- CHROMA_USER: The username for the basic auth. Default: testuser
- CHROMA_PASSWORD: The password for the basic auth. Default: testpassword

## Run

To run the docker compose:

```bash
docker-compose up -d
```

> **Note**: By default NGINX proxy will listen on 8443. You can change it in `docker-compose.yml` file.

## Testing

```bash
curl -v -u testuser:testpassword https://localhost:8443/api/v1 -k
```

## Using With Chroma Client

### Installation

```bash
pip install chromadb-client
```

### Usage

```python
import chromadb
chroma_client = chromadb.HttpClient(host='localhost', port=8443)
```
