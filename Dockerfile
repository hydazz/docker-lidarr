ARG TAG
FROM vcxpz/baseimage-alpine-arr:${TAG}

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Lidarr version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ARG BRANCH

RUN \
   echo "**** install build packages ****" && \
   apk add --no-cache --virtual=build-dependencies \
     curl && \
   echo "**** install fpcalc ****" && \
   curl --silent -o \
     /tmp/fpcalc.tar.gz -L \
     "https://github.com/acoustid/chromaprint/releases/download/v1.5.0/chromaprint-fpcalc-1.5.0-linux-x86_64.tar.gz" && \
   tar xzf \
     /tmp/fpcalc.tar.gz -C \
     /tmp/ --strip-components=2 && \
   mv /tmp/fpcalc /usr/local/bin && \
   echo "**** install lidarr ****" && \
   mkdir -p /app/lidarr/bin && \
   ARCH=$(curl -sSL https://raw.githubusercontent.com/hydazz/docker-utils/main/docker/archer.sh | bash) && \
   curl --silent -o \
     /tmp/lidarr.tar.gz -L \
     "https://lidarr.servarr.com/v1/update/${BRANCH}/updatefile?version=${VERSION}&os=linuxmusl&runtime=netcore&arch=${ARCH}" && \
   tar xzf \
     /tmp/lidarr.tar.gz -C \
     /app/lidarr/bin --strip-components=1 && \
   printf "UpdateMethod=docker\nBranch=${BRANCH}\n" > /app/lidarr/package_info && \
   echo "**** cleanup ****" && \
   apk del --purge \
     build-dependencies && \
   rm -rf \
     /app/lidarr/bin/Lidarr.Update \
     /tmp/*

# copy local files
COPY root/ /

# lidarr healthcheck
HEALTHCHECK --start-period=10s --timeout=5s \
   CMD wget -qO /dev/null 'http://localhost:8686/api/system/status' \
     --header "x-api-key: $(xmlstarlet sel -t -v '/Config/ApiKey' /config/config.xml)"

# ports and volumes
EXPOSE 8686
VOLUME /config
