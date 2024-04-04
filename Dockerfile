# Use a base image, for example, Ubuntu
FROM ubuntu:latest

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server iputils-ping


# Configure SSH
RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbrVkogbsu8RqwLGRMI81NOpwciBHtnbuiwrrc9EKvscbq8or/7e0r5A+mZ0OHUiVePgMmZ6N6PEYU78GtI4eBJ7p9qmTLPmAm6IcjaJb6PBU93x0lbwvgBRR1jl2mn24Jo6ejWrCgkcBobBlw+0jLaUc989axwIqkmdk4nYnPgz4MLotlH0vqf8cyeU6Lj6sA/XG6oQEVr5ODH3oO8wxBhHQ5tKSihFEUcsbjeRGot4h9TqK5wJJyp6d+aMPsxecuyDQLIg7lpdouNMn815ct06xT2kRq5zyRByeNJ8ADZzTYbMSG8A1Ztf4GW1L7ze2u2yZNZnabeXgYGRLI7dnpgutWIG7DESibrtTqIbc/JNX+1dHVFWRDUihXUgmLGcCJ/uKzWm1qNHEx5goR77HVAUxM4kJBOK1tHHEeCHzij36lEwPBh6tL2Tqqu/HCHhS1DzH/rdzRqiriZJnIJ7ca2AYX07dgtHBi1tsLsfar4orTi98W8JfIjj0G56+o9BM= jeanpierre@lappie' >> /root/.ssh/authorized_keys 
RUN chmod 600 /root/.ssh/authorized_keys
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir -p /run/sshd

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

