ln -sf /resources/games_back/.env /data/games_back/.env

bash /resources/wait-for-mysql.sh

#if [[ $1 = 'build' ]]; then

  cd /data/games_back
  sudo -u docker composer install
  sudo -u docker composer update

#fi

php /data/games_back/artisan migrate
php-fpm
