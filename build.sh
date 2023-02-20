#!/bin/bash
set -e

export CONSUL_VERSION="${CONSUL_VERSION:-1.14.4}"
export PACKAGE_VERSION="${CONSUL_VERSION}-1000"
export OS="${OS:-linux}"
export ARCH="${ARCH:-amd64}"
consul_zip_file="consul_${CONSUL_VERSION}_${OS}_${ARCH}.zip"
export CONSUL_URL="${CONSUL_URL:-https://releases.hashicorp.com/consul/${CONSUL_VERSION}/${consul_zip_file}}"

mkdir -p package

if [[ ! -f "./tmp/${consul_zip_file}" ]]; then
    curl --create-dirs -Lo "./tmp/$consul_zip_file" "${CONSUL_URL}"
fi

unzip -o -d "./package/bin/" "./tmp/${consul_zip_file}"

./info.sh "${PACKAGE_VERSION}" > INFO
tar -cvzf package.tgz package
tar -cvf package.spk INFO LICENSE conf/ package.tgz scripts/pre* scripts/post* scripts/start*
rm package.tgz
mv package.spk "consul_${CONSUL_VERSION}_${OS}_${ARCH}.spk"
