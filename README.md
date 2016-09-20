# waagent-phusion-docker

This image is based on the work done by @colrack available at
https://github.com/colrack/coreoswaagentdiag/

This image is based on the [phusion docker baseimage](https://phusion.github.io/baseimage-docker/)

It is used to run [WALinuxAgent](https://github.com/Azure/WALinuxAgent) and
embedded [LinuxDiagnostic](https://github.com/Azure/azure-linux-extensions/)
extension on non supported distributions.

See this [issue](https://github.com/Azure/azure-linux-extensions/issues/66) for
more info.

WA 2.0.15 + linuxdiag 2.3 was tested on NixOS 16.09

1. boot the machine
2. stop systemd waagent service
3. wait for docker daemon to start
4. start the container with embedded waagent + LinuxAzureDiagnostic
5. enable diagnostic extension (via cli, powershell, portal or api)

### Build

`docker build -t waagent-phusion-docker` .

### Run

`docker run --name waagent-phusion-docker --privileged --net=host --ipc=host --pid=host -v=/dev:/host/dev -v=/etc/ssh:/etc/ssh -v=/lib/modules:/lib/modules -v=/lib/firmware:/lib/firmware -v=/mnt:/mnt -v=/var/run:/var/run -d -v=/var/lib/waagent:/var/lib/waagent -v=/var/log:/var/log -v=/sys/fs/cgroup:/sys/fs/cgroup:ro waagent-phusion-docker`
