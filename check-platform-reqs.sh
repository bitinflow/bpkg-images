#!/bin/bash

if [ "$#" -eq 0 ]; then
  VERSION_MATRIX=('bpkg.io/laravel:8.0-octane' 'bpkg.io/laravel:8.1-octane')
else
  VERSION_MATRIX=("$@")
fi

EXTENSION_MATRIX=(
  'bcmath' 'curl' 'date' 'imagick' 'exif' 'fileinfo' 'hash' 'PDO' 'sockets'
  'json' 'mbstring' 'pdo_mysql' 'pdo_sqlite' 'sqlite3' 'zip' 'pcntl' 'redis'
  'swoole' 'posix' 'gd' 'mongodb'
)

for version in "${VERSION_MATRIX[@]}"
do
  for extension in "${EXTENSION_MATRIX[@]}"
  do
    command="$command if(!extension_loaded('$extension')) { echo 'ERROR: Extension $extension on $version is missing.' . PHP_EOL;}"
  done

  command="$command echo 'upload_max_filesize: ' . ini_get('upload_max_filesize') . PHP_EOL;"
  command="$command echo 'post_max_size: ' . ini_get('post_max_size') . PHP_EOL;"

  RESULT=$(docker run -it --rm "$version" php -r "$command")
  
  echo "$RESULT"
  
  if [[ $RESULT == *"ERROR"* ]]; then
    echo "Checks failed, abort."
    exit 1
  fi
done
