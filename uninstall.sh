#!/usr/bin/sh

REMOVE_IMAGES=""
REMOVE_VOLUMES=""

function usage()
{
    echo ""
    echo "Usage: sh $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h | --help          Show this help message and exit"
    echo "  -i | --images        Remove docker images related to installation"
    echo "  -v | --volumes       Remove all docker volumes related to installation"
    echo ""
}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        -i | --images)
            REMOVE_IMAGES="--rmi all"
            ;;
        -v | --volumes)
            REMOVE_VOLUMES="--volumes"
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

docker-compose down $REMOVE_VOLUMES $REMOVE_IMAGES

# Remove cron expressions

TEMP_FILE=".crontab.tmp"
crontab -l | grep -v 'renew_certs.sh' | grep -v 'reload_nginx_conf.sh' > $TEMP_FILE
sudo crontab -u $USER ./$TEMP_FILE
rm ./$TEMP_FILE