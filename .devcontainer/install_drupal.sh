#!/bin/bash
set -ex

mkdir drupal && cd drupal
ddev config --project-type=drupal --php-version=8.3 --docroot=web
ddev start
ddev composer create drupal/recommended-project:^10
ddev config --update
ddev composer require drush/drush
ddev drush site:install --account-name=admin --account-pass=admin -y
# use the one-time link (CTRL/CMD + Click) from the command below to edit your admin account details.
ddev drush uli
ddev launch