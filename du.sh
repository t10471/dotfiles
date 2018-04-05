#!/usr/bin/env bash

set -e
current=$(dirname ${BASH_SOURCE})
cd $current

force=false
while getopts "f" OPT; do
  case $OPT in
    f)
      force=true ;;
  esac
done
shift $(( OPTIND - 1 ))

rmi_none () {
    if [[ "$force" = true ]]; then
        cmd="docker rmi $(docker images -f "dangling=true" -q)"
    else
        cmd="docker rmi $(docker images "dangling=true" -q)"
    fi
    echo $cmd
    eval $cmd
    
}

if [[ "$1" = "rmi_by_rep" ]]; then
    if [[ -z "$2" ]]; then
        echo "need delete REPOSITORY"
        exit 1
    fi
    rep=$2
fi

if [[ "$1" = "rmi_by_tag" ]]; then
    if [[ -z "$2" ]]; then
        echo "need delete TAG"
        exit 1
    fi
    rep=$2
fi

rmi_by_rep () {
    query='select "IMAGE ID" from stdin where REPOSITORY like "'$rep'%"'
    if [[ "$force" = true ]]; then
        cmd="docker images| qq -q '$query'|xargs -J% docker rmi -f %"
    else
        cmd="docker images| qq -q '$query'|xargs -J% docker rmi %"
    fi
    echo $cmd
    eval $cmd
}

rmi_by_tag () {
    query='select "IMAGE ID" from stdin where TAG = "'$rep'"'
    if [[ "$force" = true ]]; then
        cmd="docker images| qq -q '$query'|xargs -J% docker rmi -f %"
    else
        cmd="docker images| qq -q '$query'|xargs -J% docker rmi %"
    fi
    echo $cmd
    eval $cmd
}

show_reps () {
    docker images| qq -q 'select REPOSITORY from stdin group by REPOSITORY'
}

eval $1
