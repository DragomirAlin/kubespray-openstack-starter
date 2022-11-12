FROM ubuntu:20.04

WORKDIR /project
VOLUME /project

ARG TERRAFORM_VERSION
ARG CLUSTER_NAME
ARG INFRA

RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get update && apt-get install -y \
     python3.9 \
     wget \
     nano \
     openssh-client \
     unzip \
     python3-pip \
     ansible

# Install OpenStack Client
RUN pip install python-openstackclient

# Install Terraform
RUN wget -O /usr/bin/terraform_${TERRAFORM_VERSION}_linux_amd64.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip /usr/bin/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
     && rm -f /usr/bin/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# SSH setup
COPY ${INFRA}/id_rsa.pub /root/.ssh/id_rsa.pub
COPY ${INFRA}/id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

ENTRYPOINT ["bash", "entrypoint.sh"]