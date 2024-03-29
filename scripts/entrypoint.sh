#!/bin/sh

set -e

if [ ! -f ingress.crt ]; then
    kubectl get secret gluu -o json \
    | grep '\"ssl_cert' \
    | awk -F '"' '{print $4}' \
    | base64 -d > ingress.crt
fi

if [ ! -f ingress.key ]; then
    kubectl get secret gluu -o json \
    | grep '\"ssl_key' \
    | awk -F '"' '{print $4}' \
    | base64 -d > ingress.key
fi

kubectl create secret tls tls-certificate --key ingress.key --cert ingress.crt