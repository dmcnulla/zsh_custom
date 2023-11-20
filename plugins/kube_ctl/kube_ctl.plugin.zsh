export KUBE_CONFIG='/Users/david.mcnulla/.kube/config'
export NAMESPACE=jenkins
export VSPHERE=/Users/david.mcnulla/tanzu/bin/kubectl-vsphere
export CONTEXT=taas-rnd

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
  kubectl --insecure-skip-tls-verify --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE get pods | grep "Error\|ImagePullBackOff\|ErrImagePull"
}

del_pod() {
  echo "del_pod <pod_name>"
  kubectl --insecure-skip-tls-verify --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE --grace-period=0 delete pod $1
}

ssh_kube() {
  echo "ssh_kube <pod_name>"
  kubectl --insecure-skip-tls-verify --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE exec -it $1 bash
}

port_forward_kube() {
  echo "port_fortward_kube <service_name> <port_to_forward>"
  kubectl --insecure-skip-tls-verify --kubeconfig $KUBE_CONFIG port-forward --namespace $NAMESPACE svc/$1 $2:$2
}

cp_kube() {
  echo "cp_kube <pod_name> <path_to_file>"
  kubectl --insecure-skip-tls-verify --kubeconfig $KUBE_CONFIG --namespace $NAMESPACE $1:$2 $2:t
}

alias kube_renew="${VSPHERE} login --server=10.22.124.2 --tanzu-kubernetes-cluster-name taas-rnd --tanzu-kubernetes-cluster-namespace taas-rnd-ns --insecure-skip-tls-verify --vsphere-username dm186069@td.teradata.com"
alias kube_context="kubectl config use-context ${CONTEXT}"
