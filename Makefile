PWD := ${CURDIR}
TAG?= dev

CODE_GENERATOR_VERSION="v0.24.3"

all: generate_crds

.PHONY: generate_crds
generate_crds:
	@echo "+ Generating crds"
	@go install sigs.k8s.io/controller-tools/cmd/controller-gen@latest
	@controller-gen +crd:generateEmbeddedObjectMeta=true +paths="./api/..." +output:crd:stdout > crdv1.yaml

.PHONY: build
build:
	@echo "+ Building...."
	goreleaser build --single-target --rm-dist --snapshot --output .

.PHONY: image
image: build
	docker build -t thing-controller:$(TAG) -f Dockerfile .