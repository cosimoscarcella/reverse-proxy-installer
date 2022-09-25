#!/usr/bin/sh

. ./.env

CONFIG_DIR="configuration"
LOGS_DIR=$CONFIG_DIR/certbot/logs
SCRIPT_DIR=$CONFIG_DIR/scripts

mkdir -p $LOGS_DIR

docker compose up -d certbot-endpoint

# Simulate certificate creation
echo ""
echo "Simulate certificate creation"

docker compose run --rm certbot certonly \
                                -v \
                                --webroot \
                                --webroot-path /var/www/certbot/ \
                                --dry-run \
                                -d $HOST_DOMAIN \
                                -d www.$HOST_DOMAIN \
                                -m $DOMAIN_EMAIL \
                                --no-eff-email \
                                --agree-tos || { 
    echo 'certbot simulation failed' ; 
    exit 1; }

echo ""
echo "Create domain certificates"

# Create certificates if needed
CERTFIFICATE_PATH="/etc/nginx/ssl/live/$HOST_DOMAIN/fullchain.pem"
CERTIFICATE="$(docker compose exec certbot-endpoint ls $CERTFIFICATE_PATH >> /dev/null 2>&1 && echo 'exists' || echo 'no_exists')"
if [ "$CERTIFICATE" = "exists" ]; then
    echo ""
    echo "Certificate $CERTFIFICATE_PATH already exists"
else
    echo "Creating ..."
    docker compose run --rm certbot certonly \
                                 --webroot \
                                 --webroot-path /var/www/certbot/ \
                                 -d $HOST_DOMAIN \
                                 -d www.$HOST_DOMAIN \
                                 -m $DOMAIN_EMAIL \
                                 --no-eff-email \
                                 --agree-tos || { 
    echo 'certbot failed to create certificates' ; 
    exit 1; }
fi

echo ""

# Stop certbot-entrypoint
docker compose stop certbot-endpoint
docker compose rm -f certbot-endpoint

# Start entrypoint
docker compose up -d endpoint

# Setup certificate renewal
DOCKER_COMPOSE_PATH="$(which docker-compose | rev | cut -d"/" -f2- | rev)"
WORKPLACE="$(pwd)"
TEMP_FILE=".crontab.tmp"

# At 06:00 AM
CERT_RENEW_COMMAND="0 0 6 * * ? cd $WORKPLACE && sh $SCRIPT_DIR/renew_certs.sh $LOGS_DIR $DOCKER_COMPOSE_PATH"
# At 06:15 AM
NGINX_RELOAD_COMMAND="0 15 6 * * ? cd $WORKPLACE && sh $SCRIPT_DIR/reload_nginx_conf.sh $LOGS_DIR $DOCKER_COMPOSE_PATH"

crontab -l > $TEMP_FILE
cat $TEMP_FILE | ( grep -qwF "$CERT_RENEW_COMMAND" || echo "$CERT_RENEW_COMMAND" >> $TEMP_FILE )
cat $TEMP_FILE | ( grep -qwF "$NGINX_RELOAD_COMMAND" || echo "$NGINX_RELOAD_COMMAND" >> $TEMP_FILE )
sudo crontab -u $USER ./$TEMP_FILE
rm ./$TEMP_FILE
