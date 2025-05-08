FROM alpine:3.18

# Install dependencies
RUN apk add --no-cache \
    curl \
    bash \
    git \
    openssl \
    ca-certificates

# Install Helm
RUN curl -sSL https://get.helm.sh/helm-v3.13.3-linux-amd64.tar.gz | tar -xz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    rm -rf linux-amd64

# Install kubectl
RUN curl -LO https://dl.k8s.io/release/v1.28.2/bin/linux/amd64/kubectl && \
    chmod +x kubectl && mv kubectl /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]