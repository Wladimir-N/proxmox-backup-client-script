#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if [ ! -d /var/www/${site}/web ];then
	echo "Нет такого сайта"
	exit
fi
/usr/bin/php /var/www/${site}/web/bitrix/modules/main/tools/backup_bd.php
cd /var/www/${site}/
proxmox-backup-client backup $(echo ${site} | cut -d . -f1).pxar:./web --exclude bitrix/backup/*_full_* --exclude bitrix/cache/* --exclude bitrix/html_pages/*/* --exclude bitrix/stack_cache/* --exclude upload/resize_cache/* --exclude upload/managed_cache/* --exclude .git* --ns ${NAMESPACE}
