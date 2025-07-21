This setup allows you to connect to a server behind a firewall or NAT.  
Requirements:
* outgoing ssh connections must be possible on the restricted server
* a publicly reachable ssh-server

## Restricted server setup

It would be better to run this unit as an unprivileged user instead of root.
`/etc/systemd/system/ssh-client@.service`
```
[Unit]
Description=Auto-SSH to %i
After=network.target

[Service]
ExecStart=/usr/bin/ssh -NT -o PasswordAuthentication=no -o TCPKeepAlive=yes -o ServerAliveInterval=60 %i
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

`/etc/ssh/ssh_config.d/60-reverse-ssh.conf`
```
Host my-reverse-ssh-host
  User user
  HostName example.org
  RemoteForward 9923 localhost:22
```
Setup a ssh key for the root user and add it to your remote server.

`sudo systemctl enable --now ssh-client@my-reverse-ssh-host`

## Local ssh config

```
Host jump_server
  User user
  HostName example.org
Host restricted_server
  HostName localhost
  Port 9923
  User user
  ProxyJump jump_server
```

## SELinux

In case of SELinux issues, create:
`/usr/bin/ssh-wrapped.bash`
```
#!/bin/bash
ssh "$@"
```
`chmod +x /usr/bin/ssh-wrapped.bash`
And adapt the service file to use the wrapped instead. This looks very weird, but was easier than further debugging the SELinux policies.
