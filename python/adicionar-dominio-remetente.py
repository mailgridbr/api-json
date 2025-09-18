import requests
import json

# Definição do endpoint da API
url = "https://api.mailgrid.net.br/domain/add/"

# Dados de autenticação e domínio a ser adicionado
data = {
	"token_auth": "SEU_TOKEN_AQUI",  # Token de autenticação obtido no painel do cliente
	"dominio": "dominioaseradicionado.net.br"  # Domínio a ser adicionado para envios
}

# Cabeçalhos para a requisição (informando que estamos enviando dados em JSON)
headers = {
	"Content-Type": "application/json"
}

# Fazendo a requisição POST para a API
try:
	response = requests.post(url, headers=headers, json=data, timeout=30)
	
	# Verifica o código de status da resposta
	if response.status_code >= 400:
		print(f"Erro na requisição. Código de status HTTP: {response.status_code}")
	else:
		# Decodifica e exibe a resposta formatada em JSON
		try:
			decoded_response = response.json()  # Decodifica a resposta JSON
			print("Resposta da API:")
			print(json.dumps(decoded_response, indent=4, ensure_ascii=False))  # Exibe a resposta formatada
		except json.JSONDecodeError:
			print("Erro ao processar a resposta JSON.")
except requests.exceptions.RequestException as e:
	# Captura qualquer erro relacionado à requisição
	print(f"Erro na requisição: {e}")
