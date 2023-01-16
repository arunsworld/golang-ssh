IMAGE_NAME := 192.168.64.11:32000/golang-ssh
# IMAGE_NAME := arunsworld/golang-ssh

PLATFORMS ?= linux/amd64,linux/arm64

.PHONY: container-builder
container-builder:
	docker buildx create --platform $(PLATFORMS) --name container-builder --node container-builder0 --use --config buildkitd.toml

.PHONY: images
images: Dockerfile container-builder
			echo Building docker image golang-ssh $(PLATFORM)…
			docker buildx build \
				--platform $(PLATFORMS) \
				--target builder \
				-o type=registry -t $(IMAGE_NAME) \
				-f Dockerfile \
				.
