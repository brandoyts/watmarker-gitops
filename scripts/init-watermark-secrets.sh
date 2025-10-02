#!/bin/sh

kubectl -n staging create secret generic watermark-secret --from-env-file=../.env.watermark && 
kubectl -n production create secret generic watermark-secret --from-env-file=../.env.watermark