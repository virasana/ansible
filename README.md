# Ansible Course on KodeKcloud

## Setup

I use docker.  

The following commands will fire up three docker containers with ssh enabled

```bash
docker build -t ubuntu_ssh . 
./start-ansible.sh
```

Check the IP addresses of your docker containers as follows (it will be in the 172 range): 

```
docker inspect ansible01
docker inspect ansible02
docker inspect ansible03
```

Configure your hosts file as follows (use sudo to edit /etc/hosts):

```
jeanpierre@lappie:~/git/learning/ansible$ cat /etc/hosts
127.0.0.1	localhost
127.0.1.1	lappie
172.17.0.2      ansible01
172.17.0.3      ansible02
172.17.0.4      ansible03

```


You should be able to ssh onto the containers


