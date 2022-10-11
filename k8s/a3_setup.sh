
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


printf "========================\n"
printf "|     Viewing Pods     |\n"
printf "========================\n"
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'
printf "\n\n"

echo sleeping for 5s
sleep 5


printf "==========================================\n"
printf "|     Deleting Zone Aware Deployment     |\n"
printf "==========================================\n"
kubectl delete deploy backend-zone-aware
printf "\n\n"

echo sleeping for 10s
sleep 10


printf "=======================\n"
printf "|     Viewing HPA     |\n"
printf "=======================\n"
kubectl describe hpa
printf "\n\n"



printf "========================\n"
printf "|     Viewing Pods     |\n"
printf "========================\n"
kubectl get po 
printf "\n\n"


printf "=============================\n"
printf "|     Watching it scale     |\n"
printf "=============================\n"
kubectl get po -w
printf "\n\n"






