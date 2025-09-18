# Definição da URL do endpoint da API
URL="https://api.mailgrid.net.br/consolidate/"

# Dados de autenticação e parâmetros de consulta
TOKEN_AUTH="INFORME-O-TOKEN-AQUI" 
DATANAI="2023-02-01"
HORANAI="00:01"
DATAFIM="2023-08-30"
HORAFIM="23:59"

# Montagem do JSON com os dados
DATA_JSON=$(cat <<EOF
{
	"token_auth": "$TOKEN_AUTH,
	"dataini": "$DATANAI",
	"horaini": "$HORANAI",
	"datafim": "$DATAFIM",
	"horafim": "$HORAFIM"
}
EOF
)

# Requisição cURL
curl -X POST "$URL" \  # Método POST para enviar os dados
	-H "Content-Type: application/json" \  # Define o cabeçalho Content-Type como JSON
	-d "$DATA_JSON" \  # Envia os dados no corpo da requisição
	--timeout 30 \  # Define o tempo máximo de espera para 30 segundos
	--insecure \  # Desativa a verificação SSL (substituir por --ssl-verify para uma conexão segura)
	-v  # Ativa a opção verbose para exibir o processo de requisição detalhadamente (opcional)

# O `curl` exibirá a resposta diretamente no terminal.
# Se houver erro, ele também será exibido.
