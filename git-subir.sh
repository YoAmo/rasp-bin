#!/bin/sh
# /home/pi/bin/git-update.sh
# v1.6

## FUNCION ##
# Pasando como parámetro el texto para el commit actualiza el repositorio actual
# Tambien paso como parámetro la rama donde actualizar el código
# Ahora envía usuario y clave

## PENDIENTE ##
# enviar con usuario y clave desde el archivo de configuración
# Se hace con el comando git push -u https://USUARIO:CLAVE@github.com/RpiScripts/bin master
# El problema es que si lo escribo en el script estoy dando la clave a mi cuenta de github
# Y que de momento me da un error al intentar leer el usuario y la clave de ~/.pi.conf

## EJEMPLO ##
# git-update.sh "v1.2" "version2"
# Ahora, para evitar errores directamente actualiza la RAMA -> Extensa

excluir="bin.config privado privado.json"
dir="$(PWD)";
cd $HOME/bin;

for f in $(ls);
do
  git add $f;
  printf "$f\n";
done;

for f in $excluir;
do
  git rm $f;
done;

git commit -m "$1"
git push -u https://JoseaScripts@github.com/JoseaScripts/bin "Extensa"

cd $dir