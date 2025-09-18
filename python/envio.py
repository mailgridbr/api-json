import requests
from requests.structures import CaseInsensitiveDict

# URL do endpoint da API para envio de emails
url = "https://api.mailgrid.net.br/sendmail/"

# Criando um dicionário de cabeçalhos para a requisição HTTP
headers = CaseInsensitiveDict()
headers["Content-Type"] = "application/json"  # Definindo o tipo de conteúdo como JSON

# Dados para a requisição POST - Incluindo detalhes do SMTP, remetente, destinatário, anexos e mensagem
data = """
{
	"host_smtp": "HOST-SMTP",  # Endereço do servidor SMTP
	"usuario_smtp": "USUARIO-SMTP",  # Usuário de autenticação SMTP
	"senha_smtp": "SENHA-SMTP",  # Senha de autenticação SMTP
	"emailRemetente": "EMAIL-REMETENTE",  # Email do remetente
	"nomeRemetente": "NOME-REMETENTE",  # Nome do remetente
	"emailDestino": ["dev@mailgrid.net.br", "postmaster@mailgrid.net.br"],  # Lista de emails destinatários
	"assunto": "Teste da API JSON com anexo",  # Assunto do email
	"mensagemAnexos": [
	{
		"name": "pixel.jpg",  # Nome do primeiro anexo
		"type": "image/jpeg",  # Tipo do arquivo (MIME type)
		"content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQY..."  # Conteúdo do arquivo codificado em base64
	},
	{
		"name": "pixel2.jpg",  # Nome do segundo anexo
		"type": "image/jpeg",  # Tipo do arquivo (MIME type)
		"content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQY..."  # Conteúdo do arquivo codificado em base64
		}
	],
	"mensagem": "Mensagem de teste da API com anexos. Testando anexos de html no envio da api",  # Corpo da mensagem em HTML
	"mensagemTipo": "html",  # Tipo da mensagem (HTML)
	"mensagemEncoding": "quoted-printable",  # Encoding da mensagem
	"mensagemAlt": "mensagem de teste da API JSON com anexos"  # Versão alternativa da mensagem
}
"""

# Fazendo a requisição POST para o endpoint com os cabeçalhos e os dados JSON
resp = requests.post(url, headers=headers, data=data)

# Verificando o status da resposta e exibindo o código de status HTTP
print(resp.status_code)

# Se a resposta for bem-sucedida (status code 200), pode-se processar o conteúdo da resposta
if resp.status_code == 200:
	print("Requisição bem-sucedida!")
	print(resp.json())  # Exibe a resposta JSON da API
else:
	print(f"Erro na requisição: {resp.text}")  # Exibe o erro caso a requisição falhe
								
