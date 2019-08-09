FROM alpine

LABEL maintainer="Gluu <support@gluu.org>"

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/docker-tls-initializer/k8s-kubectl" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV KUBE_LATEST_VERSION="v1.15.2"

WORKDIR /root
COPY scripts /root/scripts

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && apk add --update openssl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && chmod +x /root/scripts/entrypoint.sh

ENTRYPOINT ["/root/scripts/entrypoint.sh"]
