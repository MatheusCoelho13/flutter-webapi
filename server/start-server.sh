#!/bin/bash

# Usa ipconfig do Windows diretamente, ignora 127.x.x.x e extrai o primeiro IP válido
IP=$(/c/Windows/System32/ipconfig.exe | grep -i "IPv4" | grep -v "127.0.0.1" | sed 's/.*: //' | head -n 1)

# Verifica se IP foi obtido
if [ -z "$IP" ]; then
  echo "Erro ao obter o IP da máquina."
  exit 1
fi

# Verifica se db.json existe
if [ ! -f db.json ]; then
  echo "Arquivo db.json não encontrado!"
  exit 1
fi

# Inicia o json-server
echo "Iniciando json-server em http://$IP:3000 ..."
json-server -H 127.0.0.1 -p 3000 db.json
