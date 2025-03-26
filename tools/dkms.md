# dkms

## secure boot setup

Create key:
```bash
sudo openssl req -new -x509 \
                     -newkey rsa:2048 -keyout /var/lib/dkms/dkms-mo.key \
                     -outform DER -out /var/lib/dkms/dkms-mo.der \
                     -nodes -days 36500 -subj "/CN=Driver dkms Signing MOK"
```

Enroll key:
```bash
sudo mokutil --import /var/lib/dkms/dkms-mo.der
```

[guide](https://github.com/dell/dkms?tab=readme-ov-file#secure-boot)
