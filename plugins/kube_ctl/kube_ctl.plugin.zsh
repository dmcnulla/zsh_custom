alias delete_pods="find_pods | awk '{print \$1;}' | xargs del_pod"

find_pods() {
  echo "find_pods"
  kubectl --namespace jenkins get pods | grep "Error\|ImagePullBackOff\|ErrImagePull"
}

del_pod() {
  echo "del_pod <pod_name>"
  kubectl --namespace jenkins --grace-period=0 delete pod $1
}

ssh_kube() {
  echo "ssh_kube <pod_name>"
  kubectl --namespace jenkins exec -c sit-tests -it $1 bash
}

port_forward_kube() {
  echo "port_fortward_kube <service_name> <port_to_forward>"
  kubectl port-forward --namespace jenkins svc/$1 $2:$2
}

cp_kube() {
  echo "cp_kube <pod_name> <path_to_file>"
  kubectl --namespace jenkins $1:$2 $2:t
}
