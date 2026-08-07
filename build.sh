#!/bin/bash
set -euo pipefail

export CONSUL_VERSION="${CONSUL_VERSION:-2.0.2}"
export PACKAGE_VERSION="${CONSUL_VERSION}-1000"
export OS="${OS:-linux}"
export ARCH="${ARCH:-amd64}"
consul_zip_file="consul_${CONSUL_VERSION}_${OS}_${ARCH}.zip"
consul_sums_file="consul_${CONSUL_VERSION}_SHA256SUMS"
export CONSUL_URL="${CONSUL_URL:-https://releases.hashicorp.com/consul/${CONSUL_VERSION}/${consul_zip_file}}"
consul_sums_url="https://releases.hashicorp.com/consul/${CONSUL_VERSION}/${consul_sums_file}"

mkdir -p package

if [[ ! -f "./tmp/${consul_zip_file}" ]]; then
    curl --create-dirs -Lo "./tmp/$consul_zip_file" "${CONSUL_URL}"
fi

curl --create-dirs -Lo "./tmp/${consul_sums_file}" "${consul_sums_url}"
(cd tmp && grep " ${consul_zip_file}\$" "${consul_sums_file}" | sha256sum -c -)

unzip -o -d "./package/bin/" "./tmp/${consul_zip_file}"

./info.sh "${PACKAGE_VERSION}" "${ARCH}" > INFO
tar -cvzf package.tgz package
tar -cvf package.spk INFO LICENSE PACKAGE_ICON.PNG PACKAGE_ICON_256.PNG conf/ package.tgz scripts/pre* scripts/post* scripts/start*
rm package.tgz
mv package.spk "consul_${CONSUL_VERSION}_${OS}_${ARCH}.spk"
