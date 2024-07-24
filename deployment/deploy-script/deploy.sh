PROJECT_DIR="/var/www/html/blog"
cd $PROJECT_DIR
git pull

cd api
composer install --no-interaction --optimize-autoloader --no-dev
sudo chown -R www-data:www-data $PROJECT_DIR

php artisan storage:link
php artisan optimize:clear
php artisan down
php artisan migrate --force
php artisan optimize
php artisan up

sudo cp $PROJECT_DIR"/deployment/www.conf" /etc/php/8.3/fpm/pool.d/www.conf
sudo cp $PROJECT_DIR"/deployment/php.ini" /etc/php/8.3/fpm/conf.d/php.ini
sudo systemctl restart php8.3-fpm.service

sudo cp $PROJECT_DIR"/deployment/nginx.conf" /etc/nginx/nginx.conf
sudo cp $PROJECT_DIR"/deployment/nginx.conf" /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl reload nginx

sudo cp $PROJECT_DIR"/deployment/supervisord.conf" /etc/supervisor/conf.d/supervisord.conf
sudo supervisorctl update
sudo supervisorctl restart workers: