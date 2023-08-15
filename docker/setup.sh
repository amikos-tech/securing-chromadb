#!/bin/bash

export CHROMA_DOMAIN=${CHROMA_DOMAIN:-"localhost"}
export CHROMA_USER=${CHROMA_USER:-"testuser"}
export CHROMA_PASSWORD=${CHROMA_PASSWORD:-"testpassword"}

docker run --rm --entrypoint htpasswd httpd:2 -Bbn ${CHROMA_USER} ${CHROMA_PASSWORD} > auth/nginx.htpasswd

openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout auth/domain.key -out auth/domain.crt -subj "/O=Chroma/C=US" -config <(echo "[req]\ndistinguished_name=req\n[req]\nsubjectAltName=DNS:${CHROMA_DOMAIN}\n[req]\nx509_extensions = usr_cert\n[ usr_cert ]\nsubjectAltName=DNS:${CHROMA_DOMAIN}")
