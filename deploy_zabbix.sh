#!/usr/bin/env ksh
SOURCE_DIR=$(dirname $0)
ZABBIX_DIR=/etc/zabbix

NGINX_URL=${1:-http://localhost/nginx_status}

mkdir -p ${ZABBIX_DIR}/scripts/agentd/znginx
cp -rv ${SOURCE_DIR}/znginx/znginx.conf.example   ${ZABBIX_DIR}/scripts/agentd/znginx/znginx.conf
cp -rv ${SOURCE_DIR}/znginx/znginx.sh             ${ZABBIX_DIR}/scripts/agentd/znginx/
cp -rv ${SOURCE_DIR}/znginx/zabbix_agentd.conf    ${ZABBIX_DIR}/zabbix_agentd.d/znginx.conf
sed -i "s|NGINX_URL=.*|NGINX_URL=\"${NGINX_URL}\"|g" ${ZABBIX_DIR}/scripts/agentd/znginx/znginx.conf
