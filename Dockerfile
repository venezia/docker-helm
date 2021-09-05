FROM quay.io/venezia/alpine:3.14
MAINTAINER Michael Venezia <mvenezia@gmail.com>

ENV HELM_RELEASE=v3.6.3
ENV HELM_RELEASE_URL=https://get.helm.sh/helm-${HELM_RELEASE}-linux-amd64.tar.gz

RUN apk update && apk add wget openssl && \
    wget ${HELM_RELEASE_URL} -O - | tar -zxv linux-amd64/helm && \
    mv linux-amd64/helm /helm

FROM quay.io/venezia/alpine:3.14
COPY --from=0 /helm /helm
RUN apk update && apk add ca-certificates bash && mkdir -p /root/.helm

ENTRYPOINT ["/helm"]
