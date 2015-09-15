#!/bin/bash

. /etc/profile
PORT=$(read_attribute docker_swarm/cluster_port)
cat >/etc/sysconfig/docker <<EOF
OPTIONS='--selinux-enabled -H tcp://0.0.0.0:$PORT'
DOCKER_CERT_PATH=/etc/docker
GOTRACEBACK=crash
http_proxy='$http_proxy'
https_proxy='$https_proxy'
no_proxy='$no_proxy'
EOF

systemctl enable docker
systemctl restart docker
