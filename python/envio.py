import requests
from requests.structures import CaseInsensitiveDict

# Definindo a URL do endpoint da API MailGrid para envio de emails
url = "https://api.mailgrid.net.br/send/"

# Criando um dicionário para os cabeçalhos HTTP da requisição
headers = CaseInsensitiveDict()
headers["Authorization"] = "Content-Type: application/json"  # Cabeçalho de autorização, que deve ser ajustado conforme necessário
headers["Content-Type"] = "application/json"  # Cabeçalho que define o tipo de conteúdo como JSON

# Dados para a requisição POST - Incluindo detalhes do SMTP, remetente, destinatários, assunto e corpo da mensagem
data = """
{
    "host_smtp": "HOST-SMTP",  # Endereço do servidor SMTP
    "usuario_smtp": "USUARIO-SMTP",  # Usuário de autenticação SMTP
    "senha_smtp": "SENHA-SMTP",  # Senha de autenticação SMTP
    "emailRemetente": "EMAIL-REMETENTE",  # Email do remetente
    "nomeRemetente": "NOME-REMETENTE",  # Nome do remetente
    "emailDestino": ["postmaster@mailgrid.com.br", "dev@mailgrid.com.br"],  # Lista de emails destinatários
    "assunto": "Teste de envio via API JSON",  # Assunto do email
    "mensagem": "mensagem de teste da API JSON"  # Corpo do email
}
"""

# Fazendo a requisição POST para o endpoint com os cabeçalhos e os dados JSON
resp = requests.post(url, headers=headers, data=data)

# Verificando o código de status da resposta e exibindo o código de status HTTP
print(resp.status_code)

# Se a requisição for bem-sucedida (código 200), pode-se processar a resposta
if resp.status_code == 200:
    print("Requisição bem-sucedida!")  # Se a resposta for bem-sucedida
    print(resp.json())  # Exibe a resposta JSON da API
else:
    # Caso ocorra um erro, exibe o erro com base no código de status
    print(f"Erro na requisição: {resp.text}")
