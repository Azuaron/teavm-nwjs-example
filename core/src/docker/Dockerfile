FROM debian:bullseye

ENV	NWJS_VERSION 0.55.0
ENV	NWJS_INSTALL_DIR /opt/nwjs
ENV NPM_CONFIG_PREFIX /home/app/.npm-global
ENV NWJS_CACHE_DIR ${NPM_CONFIG_PREFIX}/lib/node_modules/nw-builder/cache

RUN	apt-get update -qq && \
    apt-get install build-essential ca-certificates xterm eterm supervisor libexif12 libgconf-2-4 \
            curl git wget \
            chromium x11vnc libxkbcommon-x11-0 libgbm-dev \
            -y --no-install-recommends && \
    apt-get --reinstall install xfonts-base -y && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN (curl -L https://deb.nodesource.com/setup_14.x | bash -) && \
    apt-get install -y nodejs && \
    ln -s /usr/bin/nodejs /usr/local/bin/node

RUN npm install nw-builder -g

WORKDIR /home/app

RUN mkdir -p ${NWJS_CACHE_DIR}/${NWJS_VERSION}-sdk/linux64 && \
    wget -qO - https://dl.nwjs.io/v${NWJS_VERSION}/nwjs-sdk-v${NWJS_VERSION}-linux-x64.tar.gz | \
    tar xfz - -C ${NWJS_CACHE_DIR}/${NWJS_VERSION}-sdk/linux64 --strip-components 1

RUN mkdir /home/app/build
RUN mkdir /home/app/package

COPY entrypoint.sh entrypoint.sh
RUN chmod 777 entrypoint.sh

CMD ./entrypoint.sh
