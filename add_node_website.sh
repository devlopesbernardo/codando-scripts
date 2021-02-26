#!/bin/sh

## $1 = website name
## $2 = port to be run
## $3 = GitHub URL
## $4 = Command to be run
## e.g, $4 => npm run dev; adonis serve --dev; etc.

echo 'First and foremost - creating proxy on NGINX'
wo site create $1 --proxy=0.0.0.0:$2 -le

echo 'Moving & clonning'

cd /var/www/$1/htdocs

############## DOWNLOAD FILES - GITHUB ################

git clone $3 .
echo 'Instalando dependências...'
npm i

## if wordops wont create a free letsencrypt, this will fix
wo site update $1 -le

forever $4
