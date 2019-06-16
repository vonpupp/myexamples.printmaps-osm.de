#!/usr/bin/env bash

rm printmaps.zip
rm printmaps.png
./printmaps download
unzip printmaps.zip
xdg-open printmaps.png
