#!/bin/sh
set -e

echo "Decoding kubeconfig..."
echo "${KUBE_CONFIG_DATA}" | base64 -d > kubeconfig
export KUBECONFIG="${PWD}/kubeconfig"

echo "Executing command:"
echo "$INPUT_COMMAND"

sh -c "$INPUT_COMMAND"