## run wireshark as user
```bash
sudo usermod -aG wireshark $USER
```

## lua protocol dissectors
I wrote two wireshark protocol dissectors for an old serial protocol called [FBUS 2](https://docs.gammu.org/protocol/nokia.html) used by nokia phones.
Look at the code here: https://git.sr.ht/~mo_k/wireshark-lua-plugins
