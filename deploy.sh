#!/bin/bash

set -e
set -u
set -x


#########  script de déploiement automatique lancé par easy-jekyll ##########

DATE=$(date +%d%m%Y-%H%M)

git co master
# élimination des fichiers temporaires
~/bin/nettoie.sh
git add -A
git ci -m "Mise à jour du blog le ${DATE}"
git push
