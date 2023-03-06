# borg backup server
Using fedora
```bash
sudo useradd backup
sudo dnf install borgbackup
sudo su backup
mkdir repos
mkdir .ssh
touch .ssh/authorized_keys
export REPO_NAME="test_repo"
export SSH_PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFYQ4IMiVEikNt5PbLKwqbGPVxgVz/SZcU1mQfuPED6D mo@apic"
echo "command=\"cd /home/backup/repos/$REPO_NAME; borg serve --append-only --storage-quota 40G --restrict-to-path /home/backup/repos/$REPO_NAME\", restrict $SSH_PUBLIC_KEY" >> ~/.ssh/authorized_keys
```
