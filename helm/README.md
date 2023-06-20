# Helm deployment instructions

## Requirements

- Helm 3, configured to use the cluster where the platform will be deployed.

## Preparation

To deploy the platform, we need to prepare the cluster, first by adding the Kuma Helm repository and installing the Kuma control plane.

```console
$ helm repo add kuma https://kumahq.github.io/charts

$ helm install --create-namespace --namespace kuma-system kuma kuma/kuma --set controlPlane.autoscaling.enabled=true
```

Then, we must create the namespace and mesh resources:

```console
$ kubectl create -f ns-and-mesh.yaml
```

At this point, the cluster is ready to deploy the platform.

TODO: Check if this is still needed

```console
$ find . -type d -name charts -print0 | xargs -0 -I{.} find {.} -type d -mindepth 1 -maxdepth 1 -exec helm dependency build {} \;
```

```console
$ helm dependency build 
```

```console
$ helm install knag . -f values.yaml --namespace knag
```