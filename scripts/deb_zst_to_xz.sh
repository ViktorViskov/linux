#!/bin/bash
FILE_NAME=$1
OUT_FILE_NAME=$(echo $FILE_NAME | awk -F '.deb' '{print $1}')
TEMP_FOLDER="/tmp/zst_to_xz"

if [ ! $FILE_NAME ]
then
echo "Usage: $0 <package.deb>"
exit 1
fi

mkdir $TEMP_FOLDER

set -e
ar x $FILE_NAME --output $TEMP_FOLDER
zstd -d < $TEMP_FOLDER/control.tar.zst | xz > $TEMP_FOLDER/control.tar.xz
zstd -d < $TEMP_FOLDER/data.tar.zst | xz > $TEMP_FOLDER/data.tar.xz
ar cr "$OUT_FILE_NAME"_repacked.deb $TEMP_FOLDER/debian-binary $TEMP_FOLDER/control.tar.xz $TEMP_FOLDER/data.tar.xz
rm $TEMP_FOLDER -rf
exit