#!/bin/bash
helm install orchestra-login-portal tremolo/orchestra-login-portal --namespace openunison -f /root/default.yaml
kubectl describe configmap api-server-config -n openunison
kubectl get secret ou-tls-certificate -n openunison -o json | jq -r '.data["tls.crt"]' | base64 -d > /path/to/ou-ca.pem
