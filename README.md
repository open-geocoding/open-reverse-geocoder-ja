# open-reverse-geocoder-ja
This repository is to manage vector tiles of address data in Japan for open-reverse-geocoder

## Tileset URL / タイルセットのURL

```
https://open-geocoding.github.io/open-reverse-geocoder-ja/tiles/{z}/{x}/{y}.pbf
```

## Requirements / 事前準備

Please make sure you have installed following library on your environment in order to make tiles. If it is MacOS, you may use the below commands to install them.

タイルデータを用意するコマンドを実行するために必要な以下のツール群をインストールする。macOS の場合は以下のようにインストールできます。

- ogr2ogr
  - `brew install gdal`
- tippercanoe
  - `brew install tippecanoe`

## How to build tilesets / タイルのビルド方法

First of all, please clone this repository from Github.

まず、このリポジトリをクローンする。

```bash
$git clone git@github.com:open-geocoding/open-reverse-geocoder-ja.git
$cd open-reverse-geocoder-ja
```

Then, execute below command.

その後、以下のコマンドを実行すること。

```bash
$npm run download
$npm run build
```

### What do these commands do? / 上述のコマンドの解説

#### English

1. It downloads the latest administrative boundaries from GSI website. Note. the latest version might change URL anytime.
2. Extract zip file.
3. Convert Shapefile to GeoJSON by using `ogr2ogr`. Note. file name may be changed in the latest version.
4. Modify properties inside vector tiles
5. Create `*.mbtiles` by using `tippecanoe`. We disabled to compress vector tiles.
6. Extract tiles from mbtiles format under specific directory in order to use tiles in static.

#### 日本語

1. まず国土数値情報から、最新の行政区域データをダウンロードする。最新版は URL が変わるので注意。
2. 解凍
3. `ogr2ogr` で GeoJSON に変換。ファイル名に注意。
4. タイルのプロパティを調整するためのスクリプトを実行。
5. `tippecanoe` で `*.mbtiles` を作成。意図的に圧縮を無効にしている。
6. タイルを分解して静的に利用できるようにする。

## Source / 出典

It uses administrative boundaries polygons from GSI in terms of data for prefectures and cities.

都道府県及び市区町村データについては、国土数値情報の行政区域ポリゴンを使用しています。

https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-N03-v2_4.html

## License / ライセンス

MIT
