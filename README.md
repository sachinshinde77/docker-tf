# docker-tf

docker run --rm \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  drone-terraform:latest --plan
