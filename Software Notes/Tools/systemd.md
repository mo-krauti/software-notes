## timers

transient user timer:
```bash
systemd-run --user --on-active=5 --on-unit-inactive 600 /path/to/executable
```
* --on-active: seconds to first run
* --on-unit-inactive: seconds to wait for next run after completion
