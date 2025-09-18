
import requests
import json

# Definição do endpoint da API para listar domínios
url = "https://api.mailgrid.net.br/domain/list/"

# Dados de autenticação (substitua pelo seu token real)
data = {
	"token_auth": "SEU_TOKEN_AQUI"  # Token obtido no painel do cliente
}

# Cabeçalhos para a requisição (informando que estamos enviando dados em JSON)
headers = {
	"Content-Type": "application/json"
}

# Fazendo a requisição POST para a API
try:
	# Realiza a requisição POST, enviando os dados no formato JSON
	response = requests.post(url, headers=headers, json=data, timeout=30)
	
	# Verifica o código de status da resposta
	if response.status_code >= 400:
		print(f"Erro na requisição. Código de status HTTP: {response.status_code}")
	else:
		# Decodifica e exibe a resposta formatada em JSON
		try:
			decoded_response = response.json()  # Decodifica a resposta JSON
			print("Resposta da API:")
			# Exibe a resposta formatada
			print(json.dumps(decoded_response, indent=4, ensure_ascii=False))
		except json.JSONDecodeError:
			print("Erro ao processar a resposta JSON.")
except requests.exceptions.RequestException as e:
	# Captura qualquer erro relacionado à requisição (erros de rede, tempo limite, etc)
	print(f"Erro na requisição: {e}")
		
