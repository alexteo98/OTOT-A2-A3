printf "===================================\n"
printf "|     Creating Metrics-Server     |\n"
printf "===================================\n"
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
printf "\n\n"

echo Sleeping for 10s
sleep 10


printf "===================================\n"
printf "|     Viewing Metrics-Server      |\n"
printf "===================================\n"
kubectl get pods --all-namespaces | grep metrics-server
printf "\n\n"

echo Sleeping for 5s
sleep 5


printf "========================\n"
printf "|     Creating HPA     |\n"
printf "========================\n"
kubectl apply -f ./manifests/hpa.yaml
printf "\n\n"

echo Sleeping for 5s
sleep 5


printf "========================\n"
printf "|     Viewing HPA      |\n"
printf "========================\n"
kubectl describe hpa
printf "\n\n"

echo Sleeping for 5s
sleep 5


printf "========================\n"
printf "|     Viewing Pods     |\n"
printf "========================\n"
kubectl get po 
printf "\n\n"


printf "========================\n"
printf "|     Viewing Pods     |\n"
printf "========================\n"
kubectl get po 
printf "\n\n"


printf "==============================\n"
printf "|     Viewing Node Zones     |\n"
printf "==============================\n"
kubectl get nodes -L topology.kubernetes.io/zone
printf "\n\n"

echo Sleeping for 5s
sleep 5


printf "==========================================\n"
printf "|     Creating Zone Aware Deployment     |\n"
printf "==========================================\n"
kubectl apply -f ./manifests/backend-zone-aware.yaml
printf "\n\n"

echo sleeping for 20s
sleep 20



printf "================================\n"
printf "|     Creating new Service     |\n"
printf "================================\n"
kubectl apply -f ./manifests/service-zone-aware.yaml
printf "\n\n"

echo sleeping for 20s
sleep 20


printf "========================\n"
printf "|     Viewing Pods     |\n"
printf "========================\n"
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'
printf "\n\n"

echo sleeping for 5s
sleep 5








