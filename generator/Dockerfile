# One-time project generator: Silicon Labs' closed-source slc (x86_64 only) in a box.
# Built from the archives in vendor/; run with --network none. See generator/README.md.
FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends unzip ca-certificates make \
    && rm -rf /var/lib/apt/lists/*
COPY vendor/slc_cli_linux.zip vendor/amazon-corretto-21-x64-linux-jdk.tar.gz /tmp/
RUN unzip -q /tmp/slc_cli_linux.zip -d /opt \
    && mkdir /opt/jdk && tar -xzf /tmp/amazon-corretto-21-x64-linux-jdk.tar.gz -C /opt/jdk --strip-components=1 \
    && rm /tmp/slc_cli_linux.zip /tmp/amazon-corretto-21-x64-linux-jdk.tar.gz \
    && chmod +x /opt/slc_cli/slc /opt/slc_cli/bin/slc-cli/slc-cli
ENV JAVA_HOME=/opt/jdk PATH=/opt/jdk/bin:/opt/slc_cli:$PATH
WORKDIR /work
