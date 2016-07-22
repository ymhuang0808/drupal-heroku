#!/bin/bash

echo 'Run scripts/deploy.sh'

path=`pwd`

drupal_path="$path/drupal"

## create Drupal 8.1 latest
composer create-project drupal/drupal:~8.1 drupal

cd "$drupal_path" && composer install

## configure
cp "$path/conf/settings.php" "$drupal_path/sites/default/"
