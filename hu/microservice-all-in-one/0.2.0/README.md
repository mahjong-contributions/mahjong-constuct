# microservice-all-in-one

Upgrade some Tiles and archive clearer structure. 

## Setup KUBECONFIG


## Setup ingress controller to expose endpoints

```bash
# Install ingress controller 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/aws/deploy.yaml


POD_NAMESPACE=ingress-nginx
POD_NAME=$(kubectl get pods -n $POD_NAMESPACE -l app.kubernetes.io/name=ingress-nginx --field-selector=status.phase=Running -o jsonpath='{.items[0].metadata.name}')

kubectl exec -it $POD_NAME -n $POD_NAMESPACE -- /nginx-ingress-controller --

# Apply yaml to expose endpoints
htpasswd -c auth admin abcd1234
kubectl create secret generic basic-auth --from-file=auth -n istio-system
kubectl get secret basic-auth -n istio-system -o yaml

kubectl apply -f observability-console.yaml -n istio-system
```

Notice:

All endpoints are exposed with header `Host`, so you can install `modheader` as header modifier for conveniency. 

## Key features
### CI/CD

1. ArgoCD web console

```bash
ARGOCD_ENDPOINT=`kubectl get svc argocd-server -n argocd -o json  |jq -r '.status.loadBalancer.ingress[].hostname'`
ARGOCD_WEB_URL=https://$ARGOCD_ENDPOINT/argocd

# Only for MacOS
open $ARGOCD_WEB_URL

# Otherwise you can copy URL from `echo $ARGOCD_WEB_URL` to your browser

# admin/argocd-server-cf87b5c86-5xlv2 for user and password to login into web console
```

2. Modify code and trigger automated release pipeline
```bash
# Visit demo application
INGRESS_ENDPOINT=`kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'`

DEMO_URL_BJ=http://$INGRESS_ENDPOINT/air/v1/city/beijing
DEMO_URL_HK=http://$INGRESS_ENDPOINT/air/v1/city/hongkong

open $DEMO_URL_BJ
open $DEMO_URL_HK

# Modify code as you want, for example: AQI Standar API

git clone git@github.com:mahjong-contributions/go-bumblebee-jazz.git
cd go-bumblebee-jazz/src/air/apis/v1/
ls
vi handlerv1.go
#Go to AQIStandard(), modify content and save
git status
git add -A
git commit -m "chore: modify AQIStandard API for demo"
git push

# Once push to GitHub and automated pipeline will be triggered

```

3. Canary deployment demo

```bash
# Install Argocd Rollouts plugin: https://argoproj.github.io/argo-rollouts/installation/#kubectl-plugin-installation

# Setup canary deployment
cd manifests/atgocd/canary
kubectl apply -f ns.yaml
kubectl apply -f air-secret.yaml -n go-bumblebee-canary
kubectl apply -f redis.yaml -n go-bumblebee-canary
kubectl apply -f air-rollout.yaml -n go-bumblebee-canary
kubectl argo rollouts get rollout air -n go-bumblebee-canary --watch


kubectl apply -f was-gateway.yaml  -n go-bumblebee-canary
kubectl apply -f was-virtual-service.yaml  -n go-bumblebee-canary
kubectl apply -f was-rollout.yaml -n go-bumblebee-canary
kubectl argo rollouts get rollout was -n go-bumblebee-canary --watch

# Check out jsons output with specific version
curl -s -H "Host: was.canary" http://a89c07d3441bb46d8b7ad30f965ff27a-2086671623.ap-southeast-1.elb.amazonaws.com/air/v1/city/beijing |jq

# Promote deployment for was
kubectl argo rollouts promote was -n go-bumblebee-canary

# Abort deployment for was
kubectl argo rollouts abort was -n go-bumblebee-canary

# Edit air-rollout.yaml to trial canary deployment and promote 
kubectl argo rollouts abort was -n go-bumblebee-canary
curl -s -H "Host: was.canary" http://a89c07d3441bb46d8b7ad30f965ff27a-2086671623.ap-southeast-1.elb.amazonaws.com/air/v1/city/beijing |jq

```


### Traffic management
1. Request routing
2. Circuit Breaking


### Observability 