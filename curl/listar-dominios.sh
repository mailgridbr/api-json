# Definição da URL do endpoint da API
URL="https://api.mailgrid.net.br/domain/list/"

# Token de autenticação (substitua com seu token real)
TOKEN_AUTH="SEU_TOKEN_AQUI"

# Dados a serem enviados no corpo da requisição em formato JSON
DATA="{\"token_auth\":\"$TOKEN_AUTH\"}"

# Requisição cURL
curl -X POST "$URL" \  # Método POST para enviar dados
	-H "Content-Type: application/json" \  # Define o cabeçalho Content-Type como JSON
	-d "$DATA" \  # Envia os dados no corpo da requisição
	--timeout 30 \  # Define o tempo máximo de espera (30 segundos)
	--ssl-verify  # Mantém a verificação SSL ativada para segurança

# A resposta será exibida diretamente no terminal, incluindo erros se houver
		
