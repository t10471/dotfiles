#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
ln -s ${PWD}/kubeabc/cli/gcp-context ~/bin/gcp-context
ln -s ${PWD}/k8s.sh ~/bin/kube-context
ln -s ${PWD}/kubeabc/cli/kube-ssh ~/bin/kube-ssh
