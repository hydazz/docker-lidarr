## docker-lidarr
[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/vcxpz/lidarr) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/lidarr?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-lidarr/actions?query=workflow%3A"Auto+Builder+CI")

Fork of [linuxserver/docker-lidarr](https://github.com/linuxserver/docker-lidarr/)

[Lidarr](https://github.com/lidarr/Lidarr) is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

## Version Information
![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![s6 overlay](https://img.shields.io/badge/s6_overlay-2.1.0.2-blue?style=for-the-badge) ![lidarr](https://img.shields.io/badge/lidarr-0.8.0.1981-blue?style=for-the-badge)

**[See here for a list of packages](https://github.com/hydazz/docker-lidarr/blob/main/package_versions.txt)**

## Usage
```
docker run -d \
  --name=lidarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -e UMASK_SET=022 `#optional` \
  -e DEBUG=true/false `#optional` \
  -p 8686:8686 \
  -v <path to appdata>:/config \
  -v <path to music>:/music \
  -v <path to downloads>:/downloads \
  --restart unless-stopped \
  vcxpz/lidarr
```

## Upgrading Lidarr
To upgrade, all you have to do is pull our latest Docker image. We automatically check for Lidarr updates daily so there may be some delay when an update is released to when the image is updated.

## Credits
* [spritsail/lidarr](https://github.com/spritsail/lidarr) for the `HEALTHCHECK` command
* [hotio](https://github.com/hotio) for the `redirect_cmd` function

**Read the official [README](https://github.com/linuxserver/docker-lidarr/) for more information**
