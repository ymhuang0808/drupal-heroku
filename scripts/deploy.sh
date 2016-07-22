#!/bin/bash

echo 'Run scripts/deploy.sh'

path=`pwd`

drupal_path="$path/drupal"

# DRUPAL_VERSION=8.1.7

# drupal_file_url="http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz"

default_config_path="$path/conf/settings.php";


## create Drupal 8.1 latest
# mkdir $drupal_path && cd $drupal_path
#
# echo "fetching $drupal_file_url"
#
# curl -fSL $drupal_file_url -o drupal.tar.gz \
# 	&& tar -xz --strip-components=1 -f drupal.tar.gz \
# 	&& rm drupal.tar.gz \
#   && chmod 755 sites

composer create-project drupal/drupal:~8.1 drupal
  && cd $drupal_path
  && composer install --no-dev --prefer-dist --optimize-autoloader --no-interaction 

## configure
echo "copy $default_config_path"

cp $default_config_path "$drupal_path/sites/default/"
