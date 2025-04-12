## Manually configure ethernet
```bash
sudo ip addr add 192.168.178.2/24 dev enp2s0
```
Cleanup
```bash
sudo ip addr flush enp2s0
```
