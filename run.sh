#!/bin/bash

set -ex

# setup the docker command
RUN="docker run -it --rm --net host -v $HOME/.ssh:/root/.ssh -w /root"
ANSIBLE="michaelsevilla/ansible --forks 50 --skip-tags package-install,with_pkg"

# move configuration files
cp * roles/ceph-ansible || true
cp -r group_vars/* roles/ceph-ansible/group_vars/

# cleanup and start ceph
$RUN -v `pwd`:/root $ANSIBLE cleanup.yml
$RUN -v `pwd`/roles/ceph-ansible:/root $ANSIBLE site.yml
