#!/bin/bash

ln -sf /resources/achievements_back/.env /data/achievements_back/.env

bash /resources/wait-for-mysql.sh

#if [[ $1 = 'build' ]]; then

  cd /data/achievements_back
  sudo -u docker composer install
  sudo -u docker composer update

#fi

php /data/achievements_back/artisan migrate
php-fpm
