###############################################################################
# Dockerfile
#  - https://github.com/CentOS/CentOS-Dockerfiles
#  - Idea incorporated from https://github.com/nmarus/docker-devops-box/
#
FROM centos8:latest

MAINTAINER John Zimmerman "john.zimm@gmail.com"

ARG LOCAL_USER=ops
ARG LOCAL_PASS=ops

ENV CONTAINER_USER ${LOCAL_USER}

ENV TERM xterm

# Updates and Base Packages
RUN yum -y update && \
    yum -y install yum-utils epel-release centos-release-scl-rh scl-utils git curl && \
    yum clean all

# Locale

# Python

# OpenJDK

# Docker Tools

# K8s Tools

# Terraform

# Puppet

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
