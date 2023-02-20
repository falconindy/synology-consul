#!/bin/sh

VERSION=$1

TIMESTAMP=$(date -u +%Y%m%d-%H:%M:%S)

os_min_ver="7.0-40356"
os_max_ver=""

cat <<EOF
package="consul"
version="${VERSION}"
arch="noarch"
thirdparty="yes"
description="Service Discovery Made Easy by HashiCorp Consul."
displayname="HashiCorp Consul"
maintainer="Nigel Bazzeghin"
maintainer_url="https://github.com/nbazzeghin/synology-consul"
create_time="${TIMESTAMP}"
support_conf_folder="yes"
startstop_restart_services="nginx"
os_min_ver="${os_min_ver}"
os_max_ver="${os_max_ver}"
silent_install="no"
silent_uninstall="no"
silent_upgrade="no"
beta="yes"
EOF
