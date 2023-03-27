#!/bin/bash

ln -sf /resources/back/.env /data/back/.env

bash /resources/wait-for-mysql.sh

if [[ $1 = 'build' ]]; then

  cd /data/back
  sudo -u docker composer install
  sudo -u docker composer update

fi

php /data/back/artisan migrate
php-fpm
