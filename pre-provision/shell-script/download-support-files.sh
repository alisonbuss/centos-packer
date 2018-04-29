#!/bin/bash

#-----------------------|DOCUMENTATION|-----------------------#
# @descr:
# @fonts: 
#-------------------------------------------------------------#

# @descr: Main function of the script, it runs automatically on the script call.
# @param: 
#    $@ | array: (*)
function StartProvisioning {

    printf '%b\n' "Starting to downloading files and binaries from support....";
    
    # Define default values.
    local folderKubernetes="/support-files/kubernetes-v1.10.0";
    local urlKubernetes="https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64";

    local folderDockerCompose="/support-files/docker-compose-v1.19.0";
    local urlDockerCompose="https://github.com/docker/compose/releases/download/1.19.0";

    local folderCNIPlugins="/support-files/cni-plugins-v0.7.1";
    local urlCNIPlugins="https://github.com/containernetworking/plugins/releases/download/v0.7.1";

    local folderActivePython="/support-files/active-python-v2.7.13";
    local urlActivePython="http://downloads.activestate.com/ActivePython/releases/2.7.13.2714";

    # Create a support folder for the files and binaries.: '/support-files/*'.
    mkdir -p "${folderKubernetes}";
    mkdir -p "${folderDockerCompose}";
    mkdir -p "${folderCNIPlugins}";
    mkdir -p "${folderActivePython}";

    # Starting downloading of files and binaries.
    wget -O "${folderKubernetes}/kube-apiserver" "${urlKubernetes}/kube-apiserver";
    wget -O "${folderKubernetes}/kube-controller-manager" "${urlKubernetes}/kube-controller-manager";
    wget -O "${folderKubernetes}/kube-scheduler" "${urlKubernetes}/kube-scheduler";
    wget -O "${folderKubernetes}/kube-proxy" "${urlKubernetes}/kube-proxy";
    wget -O "${folderKubernetes}/kubelet" "${urlKubernetes}/kubelet";
    wget -O "${folderKubernetes}/kubectl" "${urlKubernetes}/kubectl";
    wget -O "${folderDockerCompose}/docker-compose" "${urlDockerCompose}/docker-compose-Linux-x86_64";
    wget -O "${folderCNIPlugins}/cni-plugins.tgz" "${urlCNIPlugins}/cni-plugins-amd64-v0.7.1.tgz";
    wget -O "${folderActivePython}/active-python.tar.gz" "${urlActivePython}/ActivePython-2.7.13.2714-linux-x86_64-glibc-2.12-402178.tar.gz";

    chmod -R 777 /support-files;
} 

# @descr: Call of execution of the script's main function.
StartProvisioning "$@";

# @descr: Finishing the script!!! :P
exit 0;

