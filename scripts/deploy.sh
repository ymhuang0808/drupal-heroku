#!/bin/bash

echo 'Run scripts/deploy.sh'

path=`pwd`

drupal_path="$path/drupal"

DRUPAL_VERSION=8.1.7

## create Drupal 8.1 latest
mkdir $drupal_path && cd $drupal_path
curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz \
	&& tar -xz --strip-components=1 -f drupal.tar.gz \
	&& rm drupal.tar.gz \
  && chmod 755 sites

## configure
cp "$path/conf/settings.php" "$drupal_path/sites/default/"
