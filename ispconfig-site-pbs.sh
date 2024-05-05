#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
if [ ! -d /var/www/${site}/web ];then
	echo "Нет такого сайта"
	exit
fi
cd /var/www/${site}/
if [ -n "${NAMESPACE}" ]; then
  export NAMESPACE_ARG="--ns ${NAMESPACE}"
else
  export NAMESPACE_ARG=
fi
proxmox-backup-client backup $(echo ${site} | cut -d . -f1)-web.pxar:./web --exclude .git* ${NAMESPACE_ARG}
