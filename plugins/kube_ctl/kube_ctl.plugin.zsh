export KUBE_CONFIG='~/.kube/config'
export NAMESPACE=jenkins

alias delete_pods="find_pods | awk '{print \$1;}' | xargs del_pod"

set_kube_config() {
  config_file=$1
  export KUBE_CONFIG=~/.kube/$config_file
}

set_namespace() {
  export NAMESPACE=$1
}

find_pods() {
  echo "find_pods"
  kubectl --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE get pods | grep "Error\|ImagePullBackOff\|ErrImagePull"
}

del_pod() {
  echo "del_pod <pod_name>"
  kubectl --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE --grace-period=0 delete pod $1
}

ssh_kube() {
  echo "ssh_kube <pod_name>"
  kubectl --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE exec -it $1 bash
}

port_forward_kube() {
  echo "port_fortward_kube <service_name> <port_to_forward>"
  kubectl --kubeconfig $KUBE_CONFIG port-forward --namespace $NAMESPACE svc/$1 $2:$2
}

cp_kube() {
  echo "cp_kube <pod_name> <path_to_file>"
  kubectl --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE $1:$2 $2:t
}
