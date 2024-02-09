#!/bin/bash

curl -X POST https://painel.mailgrid.com.br/api/send/ -H "Authorization: Content-Type: application/json" -H "Content-Type: application/json" --data-binary @- <<DATA
{"host_smtp": "HOST-SMTP","usuario_smtp": "USUARIO-SMTP", "senha_smtp": "SENHA-SMTP", "emailRemetente": "EMAIL-REMETENTE", "nomeRemetente": "NOME-REMETENTE","emailDestino": ["postmaster@mailgrid.com.br","dev@mailgrid.com.br"], "assunto": "Teste de envio via API JSON",
"mensagem": "mensagem de teste da API JSON"}
DATA
