#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if [ ! -d /var/www/${site}/web ];then
	echo "Нет такого сайта"
	exit
fi
/usr/bin/php /var/www/${site}/web/bitrix/modules/main/tools/backup_bd.php
cd /var/www/${site}/
if [ -n "${NAMESPACE}" ]; then
  export NAMESPACE_ARG="--ns ${NAMESPACE}"
else
  export NAMESPACE_ARG=
fi
proxmox-backup-client backup $(echo ${site} | cut -d . -f1)-private.pxar:./private $(echo ${site} | cut -d . -f1)-web.pxar:./web --exclude bitrix/backup/*_full_* --exclude bitrix/cache/* --exclude bitrix/html_pages/*/* --exclude bitrix/stack_cache/* --exclude upload/resize_cache/* --exclude upload/managed_cache/* --exclude .git* ${NAMESPACE_ARG}
