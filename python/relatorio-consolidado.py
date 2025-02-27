import requests
import json

# Definição do endpoint da API
url = "https://api.mailgrid.net.br/consolidate/"

# Dados de autenticação e parâmetros de consulta
data = {
    "usuario_smtp": "smtp1@seudominio.com.br",  # Usuário SMTP para autenticação
    "senha_smtp": "xxxxxxxx",  # Senha SMTP para autenticação
    "dataini": "2023-02-01",  # Data de início da consulta (AAAA-MM-DD)
    "horaini": "00:01",  # Hora de início da consulta (HH:MM)
    "datafim": "2023-08-30",  # Data de fim da consulta (AAAA-MM-DD)
    "horafim": "23:59"  # Hora de fim da consulta (HH:MM)
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
    if response.status_code != 200:
        print(f"Erro na requisição. Código de status HTTP: {response.status_code}")
    else:
        # Exibe a resposta formatada em JSON
        print("Resposta da API:")
        # Decodifica a resposta JSON e exibe de forma legível
        decoded_response = response.json()
        print(json.dumps(decoded_response, indent=4, ensure_ascii=False))

except requests.exceptions.RequestException as e:
    # Captura qualquer erro relacionado à requisição (erros de rede, tempo limite, etc)
    print(f"Erro na requisição: {e}")
