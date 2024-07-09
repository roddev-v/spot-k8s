# spot-k8s
A cheaper, DIY Kuberentes cluster based on spot instances

Services as EKS, AKS or GKE are quite expensive. The pricing strategy that most cloud providers apply is to bill the managed Kubernetes controlplane and the individual worker nodes attached to the system and the resources those virtual machines use.

# Pricing example on popular cloud providers

// TODO compute pricing example

# spot-k8s

Spot k8s aims to provision a Kubernetes cluster utilising your choice of base compute power and a series of disposable spot instances for worker nodes.

