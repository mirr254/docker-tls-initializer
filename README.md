# docker-tls-initializer
A docker image that has kubectl installed. It is used as a job or initcontainer to generate tls . certificates for the Gluu server

### Overview
This container provides the Kubernetes client kubectl which can be used to interact with a Kubernetes cluster

### Build

`make docker_build`

### Run

`docker run <image:tag>`