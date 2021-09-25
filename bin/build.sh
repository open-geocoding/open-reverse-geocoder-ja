#!/usr/bin/env bash

set -ex

DIR=$(pwd)

ogr2ogr -f GeoJSONSeq /dev/stdout $DIR/tmp/N03-200101_GML/N03-20_200101.shp \
| node $DIR/src/filter.js \
| tippecanoe --no-tile-compression --maximum-zoom=10 --minimum-zoom=10 -l japanese-admins -o $DIR/tmp/admins.mbtiles --force

tile-join \
    --force \
    --no-tile-compression \
    -n "open-reverse-geocoder-ja-tiles" \
    -N "Japanese Address Tilesets for open-reverse-geocoder" \
    -A "「国土数値情報（行政区域データ）」（国土交通省）をもとに株式会社Geolonia作成" \
    --output-to-directory=$DIR/docs/tiles \
    --no-tile-size-limit $DIR/tmp/admins.mbtiles
