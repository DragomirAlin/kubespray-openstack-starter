# Toolbox for Deploying Kubernetes on OpenStack
![Kubernetes](img/kubernetes-logo.png)

A toolbox for deploying a Production Ready Kubernetes Cluster on Openstack. You don't have to install any dependencies or tools on your machine.

## 1. Clone Kubespray
```bash
git clone https://github.com/kubernetes-sigs/kubespray
```

## 2. Remote state for Terraform
You could store your Terraform state on OpenStack Swift.

1. Generate EC2 Credentials
```bash
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
AWS_S3_ENDPOINT=
```

2. Add `S3` backend to `kubespray/contrib/terraform/openstack/versions.tf`
```terraform
  backend "s3" {
  bucket                      = "terraform"
  key                         = "state"
  encrypt                     = false
  skip_credentials_validation = true
  skip_region_validation      = true
  force_path_style            = true
  }
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