ln -sf /resources/games_front/.env /data/games_front/.env

if [[ $1 = 'build' ]]; then
  sudo -u docker npm cache clean --force
  sudo -u docker npm config set fetch-retry-mintimeout 20000
  sudo -u docker npm config set fetch-retry-maxtimeout 120000
  mkdir -p /usr/.cache && chmod -R ugo+rw /usr/.cache && export CYPRESS_CACHE_FOLDER=/usr/.cache

  cd /data/games_front
  rm -rf node_modules
  sudo -u docker npm install
fi

cd /data/games_front
sudo -u docker npm run serve
php-fpm
