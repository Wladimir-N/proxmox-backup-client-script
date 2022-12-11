# proxmox-backup-client-script

Создайте Datastore в PBS если ещё не создан

Создайте Namespace в PBS если ещё не создан

Создайте пользователя в PBS и выдайте ему права на Namespace в этом Datastore

Склонируйте репозиторий

```cd /opt```

```git clone https://github.com/Wladimir-N/proxmox-backup-client-script.git -b ispconfig-bitrix```

Скопируйте файл .env.example к себе в дирректорию с сайтом

```su - web1 -s /bin/bash```

```cp /opt/proxmox-backup-client-script/.env.example private/.env.backup```

Внесите в него свои значения переменных

Скопируйте скрипт для создания бекапа базы

```cp /opt/proxmox-backup-client-script/backup_bd.php web/bitrix/modules/main/tools```

Настройте в битрикс регулярное резервное копирование по запуску скрипта и хранение одного бекапа локально

Установите proxmox-backup-client

```echo 'deb http://download.proxmox.com/debian/pbs-client bullseye main' >> /etc/apt/sources.list```

```wget https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg```

```apt update```

```apt install --no-install-recommends proxmox-backup-client```

Выставьте в крон в ISPConfig

```source [web_root]/../private/.env.backup && /opt/proxmox-backup-client-script/ispconfig-bitrix-pbs.sh```
