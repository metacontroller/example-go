## Example Go Controller

This controller doesn't do anything useful.
It's just an example skeleton for writing Metacontroller hooks with Go.

**WARNING**

There's a [known issue](https://github.com/GoogleCloudPlatform/metacontroller/issues/76)
that makes it difficult to produce JSON according to the rules that Metacontroller
requires if you import the official Go structs for Kubernetes APIs.
In particular, some fields will always be emitted, even if you never set them,
which goes against Metacontroller's [apply semantics](https://metacontroller.github.io/metacontroller/api/apply/).

### Prerequisites

* [Install Metacontroller](https://metacontroller.github.io/metacontroller/guide/install.html)

### Install Thing Controller

```sh
kubectl apply -f crdv1.yaml
kubectl apply -f thing-controller.yaml
```

### Create a Thing

```sh
kubectl apply -f my-thing.yaml
```

Look at the thing:

```sh
kubectl get thing -o yaml
```

Look at the thing the thing created:

```sh
kubectl get pod thing-1 -a
```

Look at what the thing the thing created said:

```sh
kubectl logs thing-1
```

### Clean up

```sh
kubectl delete -f thing-controller.yaml
```

### Building

We use `goreleaser` to build. Once is installed, run

```sh
make build
```
or just make a new container image:

```sh
make image
```
