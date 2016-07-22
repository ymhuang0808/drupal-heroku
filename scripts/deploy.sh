#!/bin/bash

echo 'Run scripts/deploy.sh'

path=`pwd`
drupal_version="8.1.7"

drupal_path="$path/drupal"

## build drupal
cd "$drupal_path" && composer install --no-dev --prefer-dist --optimize-autoloader --no-interaction

## configure
cp "$path/conf/settings.php" "$drupal_path/sites/default/"
