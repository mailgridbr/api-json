#!/bin/bash

# Defina a URL da API de envio de e-mail
API_URL="https://api.mailgrid.net.br/send/"

# Defina os parâmetros de autenticação e envio do e-mail
HOST_SMTP="HOST-SMTP"  # Substitua pelo seu host SMTP
USUARIO_SMTP="USUARIO-SMTP"  # Substitua pelo seu usuário SMTP
SENHA_SMTP="SENHA-SMTP"  # Substitua pela sua senha SMTP
EMAIL_REMETENTE="EMAIL-REMETENTE"  # Substitua pelo e-mail do remetente
NOME_REMETENTE="NOME-REMETENTE"  # Substitua pelo nome do remetente
EMAIL_DESTINOS=("postmaster@mailgrid.com.br" "dev@mailgrid.com.br")  # Lista de destinatários do e-mail
ASSUNTO="Teste de envio via API JSON"  # Assunto do e-mail
MENSAGEM="mensagem de teste da API JSON"  # Corpo da mensagem do e-mail

# Crie o corpo do JSON para a requisição
JSON_DATA=$(cat <<EOF
{
  "host_smtp": "$HOST_SMTP",
  "usuario_smtp": "$USUARIO_SMTP",
  "senha_smtp": "$SENHA_SMTP",
  "emailRemetente": "$EMAIL_REMETENTE",
  "nomeRemetente": "$NOME_REMETENTE",
  "emailDestino": $(echo ${EMAIL_DESTINOS[@]} | sed 's/ /","/g'),
  "assunto": "$ASSUNTO",
  "mensagem": "$MENSAGEM"
}
EOF
)

# Envie a requisição POST para a API utilizando o curl
curl -X POST "$API_URL" \
  -H "Authorization: Content-Type: application/json" \  # Cabeçalho de autorização e tipo de conteúdo
  -H "Content-Type: application/json" \  # Define o tipo de conteúdo como JSON
  --data-binary "$JSON_DATA"  # Envia os dados JSON como corpo da requisição

