#!/bin/bash

infofile="plugins/moment/plugin.info"
submodulepath="plugins/moment/moment"

version="$(cd "$submodulepath" && git describe --tags $(git rev-list --tags --max-count=1))"
expr="s/\"version\": \"[^\"]+\"/\"version\": \"$version\"/g"

sed -i -r -e "$expr" "$infofile"

