#!/bin/bash

set -ex

# setup the docker command
RUN="docker run -it --rm --net host -v $HOME/.ssh:/root/.ssh -w /root"
ANSIBLE="michaelsevilla/ansible --forks 50 --skip-tags package-install,with_pkg"

# move configuration files
cp site/* roles/ceph-ansible || true
cp -r site/group_vars site/roles/ceph-ansible/

# cleanup and start ceph
$RUN -v `pwd`/site:/root $ANSIBLE cleanup.yml
$RUN -v `pwd`/site/roles/ceph-ansible:/root $ANSIBLE ceph.yml
