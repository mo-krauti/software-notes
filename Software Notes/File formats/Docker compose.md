# docker compose

[reference](https://docs.docker.com/reference/compose-file/)

## healthchecks

Port open:
```yaml
    healthcheck:
      test: nc -z localhost 8080
      interval: 1m
      start_period: 2m
      start_interval: 10s
```

HTTP listening:
```yaml
    healthcheck:
      test: wget --spider localhost:8080
      interval: 1m
      start_period: 2m
      start_interval: 10s
```
