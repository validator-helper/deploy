RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        git \
        xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN rm -rf "\$HOME/deploy-repo" \
    && git clone --depth 1 \
        https://github.com/validator-helper/deploy.git \
        "\$HOME/deploy-repo"

RUN cd "\$HOME/deploy-repo" \
    && chmod +x deploy \
    && chmod +x bin/* \
    && ./deploy --fast -nl -u lucky
