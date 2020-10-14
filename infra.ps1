##
## Create Infra
##
# Create RG
az group create --name eDevOpsTalk --location westeurope

# Create ACR
az acr create --resource-group eDevOpsTalk --name eDevOpsTalk --sku Basic
az acr login --name eDevOpsTalk

# Create AKS cluster
az aks create --resource-group eDevOpsTalk --name eDevOpsTalkCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys --attach-acr eDevOpsTalk


##
## Connect to the cluster
##
# install kubectl if necessary
# az aks install-cli
# Merge config
az aks get-credentials --resource-group eDevOpsTalk --name eDevOpsTalkCluster
# Verify connection 
kubectl get nodes


##
## Deploy app
##
kubectl apply -f vote.yaml
# Test app
kubectl get service vote-app --watch


##
## Delete Cluster
##
az group delete --name eDevOpsTalk --yes --no-wait