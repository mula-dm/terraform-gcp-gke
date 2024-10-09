## Manualy deploy

# -1 Install docker/kubectl.helm.gcloud-cli/terraform
```sh
to do
```

# 0 Login with gcloud cli

```sh
gcloud auth login
gcloud auth application-default login
gcloud config set $PROJECTNAME
```

# 1 Clone repo
```sh
git clone git@github.com:mula-dm/terraform-gcp-gke.git
```

# 3 Run terraform scripts
```sh
cd terraform/
terraform init
terraform plan
terraform apply
```

# 4 Connect to the k8s cluster wi kubectl
```sh
gcloud container clusters get-credentials druid-k8s --region us-central1 --project test-project
```

# 5 Create k8s namespaces

```sh
kubectl create ns test
kubectl create ns dev
```

# 6 Delete all
```sh
terraform destroy
```

## Makefile deploy

```sh
make init_tf
make apply_tf
...
make destroy_tf
```

## Roadmap
...