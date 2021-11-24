kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
kubectl create ns openunison
helm repo add tremolo https://nexus.tremolo.io/repository/helm/
helm repo update
helm install openunison tremolo/openunison-operator --namespace openunison
while [[ $(kubectl get pods -l app=openunison-operator -n openunison -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for operator pod" && sleep 1; done
