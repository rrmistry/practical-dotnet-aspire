# K3d Custom Manifests Directory

This folder is used to store the manifests used by k3d while creating the cluster.

These manifests bridge the gap between the k3d cluster and the Azure AKS cluster.

For example, the [`azure-storage-classes.yaml`](azure-storage-classes.yaml) manifest is used to create the storage classes in the k3d cluster that are used by the Azure AKS cluster, but with one key difference: the storage provisioner drivers are all k3d's local-path-provisioner instead of Azure's provisioners.
