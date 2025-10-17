#!/bin/sh

kubectl create namespace staging && kubectl create namespace production

kubectl -n staging create secret generic watermark-secret --from-env-file=../.env.watermark && \
kubectl -n production create secret generic watermark-secret --from-env-file=../.env.watermark
