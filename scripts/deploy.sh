#!/bin/bash

echo 'Run scripts/deploy.sh'

path=`pwd`
drupal_version="8.1.7"

drupal_path="$path/drupal"

## clone submodule
git submodule update --init --recursive

## build drupal
cd "$drupal_path" && git checkout --force $drupal_version && composer install --no-dev --prefer-dist --optimize-autoloader --no-interaction

## configure
cp "$path/conf/settings.php" "$drupal_path/sites/default/"
