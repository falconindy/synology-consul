#!/bin/sh

source /var/packages/consul/var/env.sh
/var/packages/consul/target/package/bin/consul agent -config-file "${CONSUL_SHARE_DIR}/etc/consul.d/consul.hcl" -config-dir "${CONSUL_SHARE_DIR}/etc/consul.d/"
