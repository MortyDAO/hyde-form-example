TAG=tnzk/$(basename $(pwd))

docker buildx create --use
#docker buildx build -t $TAG --platform=linux/amd64,linux/arm64 --push .
docker buildx build -t $TAG --platform=linux/amd64 --push .
