#!/bin/bash

# URL do endpoint da API de relatórios
API_URL="https://api.mailgrid.net.br/report/"

# Definindo as credenciais e parâmetros para a consulta de relatórios
TOKEN_AUTH="INFORME-O-TOKEN-AQUI"  # Substitua pelo seu token de autenticação
DATA_INICIO="2022-09-27"     # Data de início para o relatório (formato: AAAA-MM-DD)
HORA_INICIO="00:01"          # Hora de início para o relatório (formato: HH:MM)
DATA_FIM="2022-09-27"        # Data de fim para o relatório (formato: AAAA-MM-DD)
HORA_FIM="23:59"             # Hora de fim para o relatório (formato: HH:MM)

# Criando o corpo JSON dinamicamente
JSON_DATA=$(cat <<EOF
{
	"token_auth": "$TOKEN_AUTH,
	"dataini": "$DATA_INICIO",
	"horaini": "$HORA_INICIO",
	"datafim": "$DATA_FIM",
	"horafim": "$HORA_FIM"
}
EOF
)

# Enviando a requisição POST para a API
curl -X POST "$API_URL" \
	-H "Authorization: Content-Type: application/json" \  # Cabeçalho de autorização e tipo de conteúdo
	-H "Content-Type: application/json" \  # Define o tipo de conteúdo como JSON
	-d "$JSON_DATA"  # Envia o corpo da requisição em formato JSON
