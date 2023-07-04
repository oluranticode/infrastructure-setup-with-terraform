# argocd-setup

helm repo add argo https://argoproj.github.io/argo-helm 
helm install argocd --namespace argocd argo/argo-cd -f manifests/argocd.yaml   

To upgrade
helm upgrade argocd --namespace argocd argo/argo-cd -f manifests/argocd.yaml 