#!/bin/bash
set -e

cat <<EOF > /var/www/bookstack/.env
APP_URL=${APP_URL}
APP_KEY=${APP_KEY}

DB_CONNECTION=mysql
DB_HOST=${DB_HOST}
DB_PORT=${DB_PORT}
DB_DATABASE=${DB_DATABASE}
DB_USERNAME=${DB_USERNAME}
DB_PASSWORD=${DB_PASSWORD}

# SSL SETTINGS
MYSQL_ATTR_SSL_CA=${DB_SSL_CA}
MYSQL_ATTR_SSL_VERIFY_SERVER_CERT=${DB_SSL_VERIFY}
EOF

php artisan migrate --force || true

exec apache2-foreground
