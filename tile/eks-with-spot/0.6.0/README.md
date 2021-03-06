# EKS with Spot Instance

The Tile is came with default EKS 1.16 and using auto scaling group with mixed spot and normal (4:1) instances. Also has Cluster Autoscaler, Horizontal Pod Autoscaler and Spot Instance Handler setup. 

## Dependent Tile

- Network0 [ v0.0.1 ]

## Changelogs
- Upgrade Default storage to 100G
- Upgrade Default EKS version to 1.17
- Support multiple autoscaling group as worker nodes 
- Support multi verision of cluster autoscaler: 1.15.6, 1.16.5, 1.17.2

## Inputs

- name: cidr
- name: vpc
- name: vpcSubnets
- name: clusterName
- name: clusterVersion
- name: keyPair4EC2
- name: capacityInstance
- name: maxSizeASG
- name: minSizeASG
- name: desiredCapacityASG
- name: cooldownASG
- name: onDemandPercentage

## Outputs 
- name: regionOfCluster
- name: clusterName
- name: clusterVersion
- name: clusterArn
- name: clusterEndpoint
- name: clusterCertificateAuthorityData
- name: masterRoleARN
- name: autoScalingGroupName
- name: autoScalingGroupMaxSize
- name: autoScalingGroupMinSize
- name: autoScalingGroupDesiredCapacity
- name: nodesRoleARN
- name: capacityInstance

## Notice
- Installed CSI driver for EFS
- Installed cluster autoscaler
- Installed spot instance termincation handler
- Installed metrics services
- Installed HPA/VPA
