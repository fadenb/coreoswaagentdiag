# coreoswaagentdiag

This is an image based on ubuntu 14.04.3 with
[WALinuxAgent](https://github.com/Azure/WALinuxAgent)
and embedded
[LinuxDiagnostic](https://github.com/Azure/azure-linux-extensions/)
extension to run on coreos.

See this [issue](https://github.com/Azure/azure-linux-extensions/issues/66) for more info.

WA 2.0.15 + linuxdiag 2.2 was tested on coreos 835.x.x

1. boot the machine
2. stop systemd waagent service
3. wait for docker daemon to start
4. start the container with embedded waagent + LinuxAzureDiagnostic
5. enable diagnostic extension (via cli, powershell, portal or api)

### Build

`docker build -t coreoswaagentdiag` .

### Run

`docker run --name coreoswaagentdiag --privileged --net=host --ipc=host --pid=host -v=/dev:/host/dev -v=/etc/ssh:/etc/ssh -v=/lib/modules:/lib/modules -v=/lib/firmware:/lib/firmware -v=/mnt:/mnt -v=/var/run:/var/run -d -v=/var/lib/waagent:/var/lib/waagent -v=/var/log:/var/log -v=/sys/fs/cgroup:/sys/fs/cgroup:ro coreoswaagentdiag`
