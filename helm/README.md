

1st install kuma
```console
$ helm repo add kuma https://kumahq.github.io/charts

$ helm install --create-namespace --namespace kuma-system kuma kuma/kuma --set controlPlane.autoscaling.enabled=true
```

2nd add namespace
```console
$ kubectl create -f ns-and-mesh.yaml
```

```console
$ find . -type d -name charts -print0 | xargs -0 -I{.} find {.} -type d -mindepth 1 -maxdepth 1 -exec helm dependency build {} \;
```

```console
$ helm dependency build 
```
```console
$ helm install knag . -f values.yaml --namespace knag
```