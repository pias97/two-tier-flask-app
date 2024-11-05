# Automatic installation of Docker and Kubernetes kubeadm on your ubuntu machine.
## To install docker engine on your VM, simply run this shell file.

```
sudo sh ./Docker.sh
```
## Then give permission to user to run docker commands

```
sudo chown $USER /var/run/docker.sock
```

# Kubeadm Installation Guide