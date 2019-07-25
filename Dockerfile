FROM ubuntu:18.04
RUN apt-get update && \
    apt-get -y install curl nano chromium-browser && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    nodejs --version && npm --version
COPY ./ /work
WORKDIR /work
ENTRYPOINT npm install && npm test