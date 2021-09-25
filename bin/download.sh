#!/usr/bin/env bash

set -ex

DIR=$(pwd)
mkdir -p $DIR/tmp
cd $DIR/tmp
wget https://nlftp.mlit.go.jp/ksj/gml/data/N03/N03-2020/N03-20200101_GML.zip -O ./data.zip
unzip -o ./data.zip
cd $DIR