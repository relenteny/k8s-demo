#!/bin/bash

export KUBECONFIG=@kubeconfig@

chart_options=""
values_file=""

for arg in "$@"
do
  case "${arg}" in
    -v | --values ) values_file=$2; shift 2 ;;
    * ) break ;;
  esac
done

# Check for nammespace
kubectl get namespace @helm.namespace@ > /dev/null 2>&1
if [[ $? == 1 ]]
then
  kubectl create namespace @helm.namespace@
fi

helm get all @helm.deployment.name@ -n @helm.namespace@ > /dev/null 2>&1
if [[ $? == 0 ]]
then
  helm delete @helm.deployment.name@ -n @helm.namespace@ > /dev/null 2>&1
fi

if [[ -n "${values_file}" ]]
then
  chart_options="${chart_options} -f ${values_file}"
fi

helm install @helm.deployment.name@ -n @helm.namespace@ @project.build.directory@/helm/@project.artifactId@ ${chart_options}


