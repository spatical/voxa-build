FROM launcher.gcr.io/google/nodejs

ENV NODE_ENV dev

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && DEBIAN_FRONTEND=noninteractive apt-get update -y \
    # install gcloud sdk
    && apt-get install google-cloud-sdk -y --no-install-recommends \
    # install zip
    && apt-get install zip -y --no-install-recommends \
    # install AWS CLI
    && pip install awscli \
    && rm -f /tmp/get-pip.py
