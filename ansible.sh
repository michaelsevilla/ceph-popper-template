#!/bin/bash

if [ -z $1 ]; then
  echo "huh? usage: $0 <ansible|ansible_playbook> <playbook>"
  exit 1
fi

set -ex
# setup the docker command

RUN="docker run -it --rm --net host -v $HOME/.ssh:/root/.ssh -w /root --entrypoint=$1"
ANSIBLE="michaelsevilla/ansible --forks 50 --skip-tags package-install,with_pkg"

# cleanup and start ceph
$RUN -v `pwd`:/root $ANSIBLE $@
