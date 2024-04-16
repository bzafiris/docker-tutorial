# docker-tutorial

## Post installation

Create docker group
```
sudo groupadd docker
```

Add the current user to the docker group 

```
sudo usermod -aG docker $USER
```

Restart the VM, in order changes to take effect, or execute the command in desktop

```
newgrp docker 
```