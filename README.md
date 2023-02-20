# HashiCorp Consul Package for Synology DSM 7+

> NOTE: This project is a derivative work of the fantastic job [@prabirshrestha](https://www.github.com/prabirshrestha) did on the Synology nomad package (https://github.com/prabirshrestha/synology-nomad)

# Building the .spk package

Requires `curl` and `unzip`.
consul binary will be downloaded on demand and bundled with the final .spk pacakge.

```bash
git clone https://github.com/nbazzeghin/synology-consul.git
cd synology-consul
./build.sh
```

To change the version to consul binary or architecture set the environment version.

```bash
ARCH=amd64 CONSUL_VERSION=1.14.4 ./build.sh
ARCH=arm64 CONSUL_VERSION=1.14.3 ./build.sh
```

# Installing the package

Use the package center from Synology DSM to import the consul spk file.
* A user `consul` will be created.
* A share `consul` will be created. For example: `/volume1/consul`.
* Default configuration can be found on the share in `/path_to_consul_share/etc/consul.d/consul.hcl`.
  Additional files can be added in the directory for other config files related to consul. Restarting the package is required for any additional changes to the config.
  > The default config is to use IP attached `eth0` as the `bind_addr`. You may need to update this value on your system if consul does not start. You can so a `sudo synonet --show` to get the network interface For example, this system has bonded network interfaces.
  ```yaml
  System network interface list:

  Host Name: MySyno
  Network interface: ovs_bond0
  Manual IP
  IP: 192.168.1.3
  Mask: 255.255.255.0
  Gateway: 192.168.1.1
  DNS: 192.168.1.1
  MTU Setting: 1500
  ```
* Data directory for consul is set as `/path_to_consul_share/var/lib/consul`
* `consul` binary can be found at `/usr/local/bin/consul`.

# Accessing consul UI

Consul is accessiblity via the `SynologyIP:8500` port. 

# Uninstalling

* Uninstall can be done via the package center.
* Due to the nature of how packages work in Synology, `consul` user and `consul` share will not be removed during uninstallation of the package.
 Reinstalling the package will reuse exisiting configurations and data. If you want clean installation you can remove the `consul` share and install the package again.
* To delete `consul` user run `sudo synogroup --del consul` after package has been uninstall.

# LICENSE

MIT.
For consul binary refer to the consul license https://github.com/hashicorp/consul/blob/main/LICENSE.
