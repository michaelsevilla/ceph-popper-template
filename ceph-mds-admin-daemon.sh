#!/bin/bash

./ansible.sh mdss -m shell -a "docker exec ceph-\`hostname\`-mds ceph --admin-daemon /var/run/ceph/ceph-mds.\`hostname\`.asok $@"

