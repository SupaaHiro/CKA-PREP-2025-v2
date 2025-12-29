# Create namespace
kubectl create namespace argocd

# Add repo and template manifests (CRDs not installed)
helm repo add argocd https://argoproj.github.io/argo-helm
helm repo update
helm template argocd argo/argo-cd --version 7.7.3 --set crds.install=false --namespace argocd > /root/argo-helm.yaml
cat /root/argo-helm.yaml   # confirm output

# Addictional Notes

# How can I list the charts of a repo?
helm search repo argocd

# How can I list the versions of a chart?
helm search repo argocd/argo-cd --versions

# How can I see the README of a chart?
helm show readme argo/argo-cd --version 7.7.3

# How can I see the default values of a chart?
helm show values argo/argo-cd --version 7.7.3

# Install ArgoCD without CRDs
helm install argocd argocd/argo-cd --version=7.7.3 -n argocd --set crds.install=false

# How can I validate the generated manifests?
k create -f /root/argo-helm.yaml --dry-run=server
