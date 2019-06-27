# Docker image packed full of useful tools

Useful for running on a kubernetes cluster:

```
kubectl run --generator=run-pod/v1 -it --rm --image=z0mbix/debug-tools debug-tools
```

This will give you a bash shell

## Tools available in this image:

- awscli
- bash
- bash-completion
- bind-tools
- bwm-ng
- bzip2
- curl
- git
- gzip
- jq
- kubectl
- netcat-openbsd
- ngrep
- nmap
- nmap-ncat
- nmap-nping
- openssh-client
- openssl
- python3
- redis
- rsync
- socat
- tmux
- unzip
- vim
- wget

## Python 3 packages available:

- PyYAML
- awscli
- boto3
- botocore
- ipaddress
- requests
