```bash
sudo apt install -y ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw status verbose
sudo ufw enable
```

Allow dhcp (server):
```bash
sudo ufw allow proto udp from 0.0.0.0/0 to 0.0.0.0/0 port 67
```
