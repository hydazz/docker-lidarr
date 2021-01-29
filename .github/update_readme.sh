#!/bin/bash

sed -i -E \
	-e "s/lidarr-.*?-blue/lidarr-${APP_VERSION}-blue/g" \
	README.md
