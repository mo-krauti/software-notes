## targets

[Bootup process graph](https://www.freedesktop.org/software/systemd/man/latest/bootup.html)

### `network-online.target`
See [systemd docs](https://systemd.io/NETWORK_ONLINE/)
If `systemd-networkd` and [[NetworkManager]] are running in parallel, 
both `NetworkManager-wait-online.service` and `systemd-networkd-wait-online.service` must start so
that `network-online.target` is reached. 
Most of the the time you will only use one which leads to the other one reaching a timeout, delaying the `network-online.target`. So just disable the other one.

## timers

transient user timer:
```bash
systemd-run --user --on-active=5 --on-unit-inactive 600 /path/to/executable
```
* --on-active: seconds to first run
* --on-unit-inactive: seconds to wait for next run after completion
