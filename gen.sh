#!/usr/bin/env bash

if [ ! -e ./php-version ] || [ ! -s ./php-version ]; then
	echo "FATAL: Please run bootstrap.sh first."
	exit 1
fi

PHP_VER=`cat php-version`

case $PHP_VER in
5.4|5.5|5.6)
	PHP_SO=php5
	PHP_C=php_embed.c.5
  ;;
*)
	PHP_SO=php7
	PHP_C=php_embed.c.7
	echo "FATAL: Under development" 
	exit 1
  ;;
esac

PWD=`pwd`

sed "s/%PHP.SO%/${PHP_SO}/" php_embed.go.template | sed "s\\%PWD%\\${PWD}\\g" > php-embed.go
cp php_embed.c.5 php-embed.c

exit 0
