## add user

```dockerfile
ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
USER $USERNAME
```

## install packages

Fedora:
```dockerfile
COPY packages.txt /packages.txt
RUN dnf install -y $(cat /packages.txt) && sudo dnf clean all
```

Debian / Ubuntu:
```dockerfile
COPY packages.txt /packages.txt
RUN apt-get update && apt-get install -y --no-install-recommends $(cat /packages.txt) \
  && rm -rf /var/lib/apt/lists/*
```
