# Hu & Tiles

Check out following handy solutions from Hu, or build your own with Tiles.

## Hu

|        Hu    | Version | Description      |
|-----------------|---------|------------------|
| Simple EKS| [v0.1.0](./repo/hu/eks-simple.yaml)| Quick launch with few lines of yaml.|
| EKS with Spot instance| [v0.1.0](./repo/hu/eks-spot-simple.yaml)| Quick launch EKS cluster with mixed spot and on-demand instances, as well as handling spot termination, cluster auto scaler and HPA. |
| EKS Fargate| [v0.1.0](./repo/hu/eks-fargate-simple.yaml)| Quick launch EKS Fargate with typical configuration. |
| EKS with Aurora MySQL| [v0.1.0](./repo/hu/eks-fargate-simple.yaml)| Quick launch EKS cluster with fine tune configuration and Aurora MySQL. |
| Simple ArgoCD | [v0.1.0](./repo/hu/argocd-simple.yaml) | Setup ArgoCD on EKS with simple configuration.|
| Basic CD with ArgoCD | [v0.1.0](./repo/hu/argocd-with-app.yaml) | Building a modern CD with example applicaiton on GitHub, all you need is a GitHub token.|
| Simple Elasticsearch | [v0.1.0](./repo/hu/elasticsearch-simple.yaml) | Elasticsearch wtih ultra-warm nodes.|
| Perfect Microservice on EKS | [v0.1.0](./repo/hu/09-microservice-all-in-one.yaml) |  Implement a handy containerized Microsercices architecture on EKS with all major componnets and demo applications. |


## Tiles

|        Tiles    | Version | Description      |
|-----------------|---------|------------------|
| Basic Network | [v0.0.1](./repo/tile/network0/0.0.1)  | The classic network pattern cross multiple availibilty zone with public and private subnets, NAT, etc. |
| Simple EKS| [v0.0.1](./repo/tile/eks0/0.0.1)| The basic EKS cluster, which uses EKS 1.15 as default version and depends on Network0. |
| | [v0.0.5](./repo/tile/eks0/0.0.5)| Update EKS default version to 1.16 and expose more options. |
| EKS on Spot | [v0.5.0](./repo/tile/eks-with-spot/0.5.0)| Provison EKS 1.16 as default and using auto scaling group with mixed spot and normal (4:1) instances. Also has Cluster Autoscaler, Horizontal Pod Autoscaler and Spot Instance Handler setup. |
|EFS | [v0.1.0](./repo/tile/efs/0.1.0)|The basic EFS conpoment and based on Network0. EFS is a perfect choice as storage option for Kubernetes. |
|ArgoCD | [v1.5.2](./repo/tile/argocd0/1.5.2)|The Argocd0 is basic component to help build up GitOps based CI/CD capability, which depends on Tile - Eks0 & Network0.|
|Go-Bumblebee-ONLY| [v0.0.1](./repo/tile/go-bumblebee-only/0.0.1) | This is demo application, which can be deploy to Kubernetes cluster to demostrate rich capabilities.|
|Istio | [v1.5.4](./repo/tile/istio0/1.5.4) | Setup Istio 1.6 on EKS with all necessary features. Managed by Istio operator and Egress Gateway was off by default. |
|AWS KMS | [v0.1.0](./repo/tile/aws-kms-keygenerator/0.1.0) | Generate both symmetric key and asymmetric key for down stream applications or services |
|AWS ElastiCache Redis | [v5.0.6](./repo/tile/aws-elasticache-redis/5.0.6) | Setup a redis cluster with replcation group with flexiable options. |
|AWS Aurora Mtsql | [v2.07.2](./repo/tile/aws-aurora-mysql/2.07.2) | Provision a Aurora MySQL cluster and integrated with Secret Manager to automate secret ratation. |
| Go-BumbleBee-Jazz | [v0.7.1](./repo/tile/go-bumblebee-jazz/0.7.1) | Modern cloud native application with tipycal features to try out how great your Kubernetes cluster are.|
| Ambassador | [v1.5.0](./repo/tile/ambassador/1.5.0) | Easily expose, secure, and manage traffic to your Kubernetes microservices of any type. Kubernetes API Gateway + Layer 7 Load Balancer + Kubernetes Ingress and more|
| Linkerd | [v2.7.1](./repo/tile/linkerd/2.7.1) | Ultralight, security-first service mesh for Kubernetes|
| FluentBit for AWS Elasticsearch | [v1.5.0](./repo/tile/fluentbit-for-aes/1.5.0) | Fluent Bit is an open source and multi-platform Log Processor and Forwarder which allows you to collect data/logs from different sources, unify and send them to multiple destinations.|
| MySQL on Kubenetes | [v0.1.0](./repo/tile/mysql-k8s/0.1.0) | MyQL 5.6 on Kubernetes |
| Jaeger Tracinng | [v1.18.1](./repo/tile/jaeger-tracing/1.18.1) | It's an open source, end-to-end distributed tracing. |
| Traefik | [v1.18.1](./repo/tile/traefik/2.2.1) | The Cloud Native Edge Router. |
| Sealed-Secret | [v0.1.0](./repo/tile/sealedsecret-with-existing-eks/0.1.0) | Encrypt your Secret into a SealedSecret, which is safe to store - even to a public repository. |
| Amazon Elasticsearch | [v7.4.0](./repo/tile/aws-elasticsearch/7.4.0) |  It is a fully managed service that makes it easy for you to deploy, secure, and run Elasticsearch cost effectively at scale. |
