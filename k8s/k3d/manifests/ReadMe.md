# K3d Manifests Directory

This folder is used to store the manifests used by k3d to create the cluster.

This folder is mounted to the k3d cluster as `/var/lib/rancher/k3s/server/manifests` and is used to pre-load the cluster with the manifests.

The mounting happens when creating the cluster with the k3d config file `k3d-config.yaml` in the parent directory.

See the header of the config file on how to create the cluster.

See the [`custom/ReadMe.md`](custom/ReadMe.md) file for more information on the custom manifests.
