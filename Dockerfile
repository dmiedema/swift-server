FROM swift:latest

# Setup Prerequisits
USER root
RUN apt-get update \
  && apt-get install -y openssl libssl-dev uuid-dev

# Create App Directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy Source Files
COPY ./Sources /usr/src/app

# Install App Dependencies
COPY Package.swift /usr/src/app

EXPOSE 3000

RUN swift build
CMD [ ".build/debug/swift-server" ]
# CMD [ "/bin/bash", "-l", "-c", "swift build && .build/debug/swift-server" ]

