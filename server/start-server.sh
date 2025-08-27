#!/bin/bash

# Usa ipconfig do Windows diretamente, ignora 127.x.x.x e extrai o primeiro IP válido

# Verifica se db.json existe
if [ ! -f db.json ]; then
  echo "Arquivo db.json não encontrado!"
  exit 1
fi

# Inicia o json-server

json-server -H 192.168.40.64 -p 9000 db.json
