FROM launcher.gcr.io/google/nodejs

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && DEBIAN_FRONTEND=noninteractive apt-get update -y \
    # install gcloud sdk
    && apt-get install google-cloud-sdk -y --no-install-recommends \
    # install zip
    && apt-get install zip -y --no-install-recommends \
    # install AWS CLI (requires python and pip)
    && apt-get install -y --no-install-recommends \
        build-essential g++ python2.7 python2.7-dev unzip curl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /tmp \
    && cd /tmp \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli \
    && rm -f /tmp/get-pip.py \
    # install Voxa CLI and tools for compiling interaction models
    && yarn global add voxa-cli \
    && yarn global add ts-node
