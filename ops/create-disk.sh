#!/usr/bin/env bash

k8location="$1"
storage_account_name="$2"

echo "creating persistent volume storage class"
cp disks/azure-disk.yaml.tmpl ./azure-disk.yaml
chmod 752 azure-disk.yaml
sed -i.bu "s/DEPLOYMENT_PREFIX/${storage_account_name}/" ./azure-disk.yaml
sed -i.bu "s/DEPLOYMENT_LOCATION/${k8location}/" ./azure-disk.yaml

sudo kubectl create -f azure-disk.yaml
