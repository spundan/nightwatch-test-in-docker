FROM ubuntu:18.04
RUN apt-get update && \
    apt-get --no-install-recommends -y install curl chromium-browser && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get --no-install-recommends install -y nodejs && \
    apt-get -y remove curl && \
    apt-get -y clean && \ 
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    nodejs --version && npm --version
COPY ./ /work
WORKDIR /work
ENTRYPOINT npm install && npm test
