import requests
from requests.structures import CaseInsensitiveDict

# URL do endpoint da API mailgrid para consultar relatórios
url = "https://api.mailgrid.net.br/report/"

# Criando um dicionário para os cabeçalhos HTTP da requisição
headers = CaseInsensitiveDict()
headers["Content-Type"] = "application/json"  # Cabeçalho que define o tipo de conteúdo como JSON

# Dados para a requisição POST - Contém informações sobre o período de consulta do relatório
data = '{"token_auth": "INFORME-O-TOKEN-AQUI, "dataini": "2022-09-27", "horaini": "00:01", "datafim": "2022-09-27", 
"horafim": "23:59"}'

# Fazendo a requisição POST para o endpoint com os cabeçalhos e os dados JSON
resp = requests.post(url, headers=headers, data=data)

# Verificando o código de status da resposta e exibindo o código de status HTTP
print(resp.status_code)

# Se a requisição for bem-sucedida (código 200), pode-se processar a resposta
if resp.status_code == 200:
	print("Requisição bem-sucedida!")  # Caso a resposta tenha sido bem-sucedida
	print(resp.json())  # Exibe a resposta JSON da API, que pode conter o relatório solicitado
else:
	# Caso ocorra um erro, exibe o erro com base no código de status
	print(f"Erro na requisição: {resp.text}")		
