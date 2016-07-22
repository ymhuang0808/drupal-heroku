#!/bin/bash

echo 'Run scripts/deploy.sh'

path=`pwd`
drupal_version="8.1.7"

drupal_path="$path/drupal"

## build drupal
cd "$drupal_path" && git checkout --force $drupal_version && composer install

cp "$path/conf/settings.php" "$drupal_path/sites/default/"
