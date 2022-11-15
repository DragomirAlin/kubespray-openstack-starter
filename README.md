# Toolbox for Deploying Kubernetes on OpenStack
![Kubernetes](img/kubernetes-logo.png)

A toolbox for deploying a Production Ready Kubernetes Cluster on Openstack. You don't have to install any dependencies or tools on your machine.

## 1. Clone Kubespray
```bash
git clone https://github.com/kubernetes-sigs/kubespray
```

## 2. Environment Variables for Image
```bash
TERRAFORM_VERSION= # terraform version
CLUSTER_NAME= # your cluster name
SSH_KEY_PATH= # your ssh keys path
```

## 3. Your OpenStack credentials
Generate your application credentials from your OpenStack provider
```bash
OS_AUTH_TYPE=v3applicationcredential
OS_AUTH_URL=
OS_IDENTITY_API_VERSION=
OS_REGION_NAME=
OS_INTERFACE=
OS_APPLICATION_CREDENTIAL_ID=
OS_APPLICATION_CREDENTIAL_SECRET=
```

## 4. Build Toolbox
```bash
docker-compose build infra
```

## 5. Run Toolbox
```bash
docker-compose run infra
```