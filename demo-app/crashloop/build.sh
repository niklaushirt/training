
podman build -t niklaushirt/crashloop:1.0.0 .
podman push niklaushirt/crashloop:1.0.0


podman build -t docker.io/niklaushirt/crashloop:arm .
podman push docker.io/niklaushirt/crashloop:arm



podman run niklaushirt/crashloop:arm --rm -d -p 3000:3000

