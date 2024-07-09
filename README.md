# spot-k8s
A cheaper, DIY Kuberentes cluster based on spot instances

Services as EKS, AKS or GKE are quite expensive. The pricing strategy that most cloud providers apply is to bill the managed Kubernetes controlplane and the individual worker nodes attached to the system and the resources those virtual machines use.

# Pricing example on popular cloud providers

Cloud provider | Price
--- | --- |
DigitalOcean | 12$/month/node
AWS EKS | $0.10/cluster/hour + Compute pricing
Azure AKS | $0.10/cluster/hour + Compute pricing
Google GKE | $0.10/cluster/hour + Compute pricing

Only the managed controlplane provided by the major cloud providers add up to around 75$/month without taking in consideration the compute pricing of the worker nodes.

# spot-k8s
Spot k8s aims to provision a Kubernetes cluster utilising your choice of base compute power and a series of disposable spot instances for worker nodes.

# Disclaimer
This project should not be viewed as a production grade Kubernetes cluster set-up automation tool. It aims to provide a cheap and easy way of setting up a Kubernetes cluster for learning purposes.

# Target audience
The target audience for this project is anybody who wants to learn Kubernetes and needs a cheap playground that can be used without worring about messing up your current environment.

# Personal note
I started this project because I wanted to learn more about IaaC, more specific Terraform. My end goal was to create a one-line command set-up automation tool that can set-up the entire infrastructure required by a Kubernetes cluster while aiming to lower the cost as much as possible.