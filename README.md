## docker-lidarr

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/lidarr) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/lidarr?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-lidarr/actions?query=workflow%3A"Auto+Builder+CI") [![codacy branch grade](https://img.shields.io/codacy/grade/2901b73e66614f818c1d3f19b3b9ff21/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-lidarr)

Fork of [linuxserver/docker-lidarr](https://github.com/linuxserver/docker-lidarr/) (Equivalent to nightly-1.0.0.2226-ls50)

[Lidarr](https://github.com/lidarr/Lidarr) is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

## Usage

```bash
docker run -d \
  --name=lidarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -e DEBUG=true/false #optional \
  -p 8686:8686 \
  -v <path to appdata>:/config \
  -v <path to music>:/music \
  -v <path to downloads>:/downloads \
  --restart unless-stopped \
  vcxpz/lidarr
```

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/lidarr.xml)

## New Environment Variables

| Name    | Description                                                                                              | Default Value |
| ------- | -------------------------------------------------------------------------------------------------------- | ------------- |
| `DEBUG` | set `true` to display errors in the Docker logs. When set to `false` the Docker log is completely muted. | `false`       |

**See other variables on the official [README](https://github.com/linuxserver/docker-lidarr/)**

## Upgrading Lidarr

To upgrade, all you have to do is pull the latest Docker image. We automatically check for Lidarr updates every hour. When a new version is released, we build and publish an image both as a version tag and on `:latest`.

## Credits

-   [spritsail/lidarr](https://github.com/spritsail/lidarr) for the `HEALTHCHECK` command
-   [hotio](https://github.com/hotio) for the `redirect_cmd` function

## Fixing Appdata Permissions

If you ever accidentally screw up the permissions on the appdata folder, run `fix-perms` within the container. This will restore most of the files/folders with the correct permissions.
