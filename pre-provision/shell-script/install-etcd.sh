#!/bin/bash

#-----------------------|DOCUMENTATION|-----------------------#
# @descr:
# @fonts: https://blog.kingj.net/2017/04/22/how-to/upgrading-a-etcd-cluster-from-version-2-3-to-version-3-0-on-coreos-container-linux/
#         https://github.com/coreos/etcd/blob/master/Documentation/dev-guide/interacting_v3.md
#         https://dzone.com/articles/upgrading-kubernetes-on-bare-metal-coreos-cluster-1
#         https://coreos.com/rkt/docs/latest/signing-and-verification-guide.html#download-and-verify-an-aci  
#-------------------------------------------------------------#

# @descr: Main function of the script, it runs automatically on the script call.
# @param: 
#    $@ | array: (*)
function StartInstallation {
    
    printf '%b\n' "CoreOS already has (ETCD) installed on your system...";
    
    # Download and verify an ACI
    # Using the fetch subcommand you can download and verify an ACI without immediately
    # running a pod. This can be useful to precache ACIs on a large number of hosts:
    # https://coreos.com/releases/#1632.3.0
    # https://quay.io/repository/coreos/etcd?tab=tags
    rkt fetch quay.io/coreos/etcd:v3.2.11 --insecure-options=image;

} 

# @descr: Call of execution of the script's main function.
StartInstallation "$@";

# @descr: Finishing the script!!! :P
exit 0;