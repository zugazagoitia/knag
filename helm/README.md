

```console
$ find . -type d -name charts -print0 | xargs -0 -I{.} find {.} -type d -mindepth 1 -maxdepth 1 -exec helm dependency build {} \;
```
```console
$ helm dependency build 
```
```console
$ helm install . -f values.yaml --generate-name
```