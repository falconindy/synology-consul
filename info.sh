#!/bin/sh

VERSION=$1
GOARCH=${2:-amd64}

TIMESTAMP=$(date -u +%Y%m%d-%H:%M:%S)

os_min_ver="7.0-40356"
os_max_ver=""

# consul ships a compiled binary, so this must match the DSM platform the
# binary was built for; "noarch" is only valid for interpreted packages.
case "$GOARCH" in
    amd64) dsm_arch="x86_64" ;;
    arm64) dsm_arch="arm64" ;;
    *)
        echo "info.sh: don't know the DSM arch value for GOARCH='${GOARCH}'; update the mapping in info.sh" >&2
        exit 1
        ;;
esac

cat <<EOF
package="consul"
version="${VERSION}"
arch="${dsm_arch}"
thirdparty="yes"
description="Service Discovery Made Easy by HashiCorp Consul."
displayname="HashiCorp Consul"
maintainer="Dave Reisner"
maintainer_url="https://github.com/falconindy/synology-consul"
create_time="${TIMESTAMP}"
support_conf_folder="yes"
os_min_ver="${os_min_ver}"
os_max_ver="${os_max_ver}"
silent_install="no"
silent_uninstall="no"
silent_upgrade="no"
beta="no"
EOF
