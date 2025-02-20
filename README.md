# NULIX OS builder

1. Build the images:

```sh
docker build --platform=linux/arm64 -t nulix/builder:os-arm64 .
docker build --platform=linux/amd64 -t nulix/builder:os-amd64 .
```

2. Push the images to docker registry:

```sh
docker push nulix/builder:os-arm64
docker push nulix/builder:os-amd64
```

3. Create the manifest:

```sh
docker manifest create nulix/builder:os nulix/builder:os-arm64 nulix/builder:os-amd64
```

4. Push the manifest to docker registry:

```sh
docker manifest push nulix/builder:os
```

5. Create the container:

```sh
docker run -it \
  -v ~/path/to/nulix-os:/root/nulix-os \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name nulix-builder \
  nulix/builder:os
```

6. Start the container every other time:

```sh
docker start nulix-builder && docker attach nulix-builder
```
