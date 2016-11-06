#!/bin/bash

if [ -z $1 ]; then
  echo "huh? usage: $0 <ansible|ansible_playbook> <playbook>"
  exit 1
fi

set -ex
# setup the docker command
RUN="docker run -it --rm --net host -v $HOME/.ssh:/root/.ssh -w /root --entrypoint=ansible"
ANSIBLE="michaelsevilla/ansible"

# cleanup and start ceph
$RUN -v `pwd`/site:/root $ANSIBLE $@
