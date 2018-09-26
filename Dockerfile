FROM alpine:3.8
MAINTAINER Michael Venezia <mvenezia@gmail.com>

ENV HELM_RELEASE=v2.11.0
ENV HELM_RELEASE_URL=https://storage.googleapis.com/kubernetes-helm/helm-${HELM_RELEASE}-linux-amd64.tar.gz

RUN apk update && apk add wget openssl && \
    wget ${HELM_RELEASE_URL} -O - | tar -zxv linux-amd64/helm && \
    mv linux-amd64/helm /helm

FROM alpine:3.8
COPY --from=0 /helm /helm
RUN apk update && apk add ca-certificates bash && mkdir -p /root/.helm


