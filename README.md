## docker-lidarr

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/lidarr) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/lidarr?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-lidarr/actions?query=workflow%3A"Auto+Builder+CI") [![codacy branch grade](https://img.shields.io/codacy/grade/2901b73e66614f818c1d3f19b3b9ff21/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-lidarr)

Fork of [linuxserver/docker-lidarr](https://github.com/linuxserver/docker-lidarr/)

[Lidarr](https://github.com/lidarr/Lidarr) is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

## Version Information

![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![lidarr](https://img.shields.io/badge/lidarr-0.8.0.2041-blue?style=for-the-badge)

See [package_versions.txt](package_versions.txt) for a full list of the packages and package versions used in this image

## Usage

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

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/readarr.xml)

## New Environment Variables

### Debug

| Name    | Description                                                                                              | Default Value |
| ------- | -------------------------------------------------------------------------------------------------------- | ------------- |
| `DEBUG` | set `true` to display errors in the Docker logs. When set to `false` the Docker log is completely muted. | `false`       |

**See other variables on the official [README](https://github.com/linuxserver/docker-lidarr/)**

## Upgrading Lidarr

To upgrade, all you have to do is pull our latest Docker image. We automatically check for Lidarr updates daily so there may be some delay when an update is released to when the image is updated.

## Credits

-   [spritsail/lidarr](https://github.com/spritsail/lidarr) for the `HEALTHCHECK` command
-   [hotio](https://github.com/hotio) for the `redirect_cmd` function
