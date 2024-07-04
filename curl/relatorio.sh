#!/bin/bash

curl -X POST https://api.mailgrid.net.br/report/ -H "Authorization: Content-Type: application/json" -H "Content-Type: application/json" -d "{\"usuario_smtp\": \"USUARIO-SMTP\", \"senha_smtp\": \"SENHA-SMTP\", \"dataini\": \"2022-09-27\", \"horaini\": \"00:01\", \"datafim\": \"2022-09-27\", \"horafim\": \"23:59\"}"
