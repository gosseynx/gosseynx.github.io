#!/bin/bash

#set -e
#set -u
#set -x


#########  script de déploiement automatique lancé par easy-jekyll ##########

DATE1=$(date +%d/:m/%Y)
DATE2=" à "
DATE3=$(date +%H:%M) 
DATE4=$DATE1$DATE2$DATE3

git co master
# élimination des fichiers temporaires
~/bin/nettoie.sh
git add -A
git ci -m "Mise à jour du blog le ${DATE4}"
git push
