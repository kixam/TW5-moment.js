#!/bin/bash

# settings
infofile="plugins/moment/plugin.info"
submodulepath="plugins/moment/moment"

# fetch latest version
git submodule update --init --recursive --remote

# get version number
version="$(cd "$submodulepath" && git describe --tags $(git rev-list --tags --max-count=1))"
expr="s/\"version\": \"[^\"]+\"/\"version\": \"$version\"/g"

# update version in plugin
sed -i -r -e "$expr" "$infofile"

echo "Using moment.js version $version"

