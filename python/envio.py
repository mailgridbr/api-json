import requests
from requests.structures import CaseInsensitiveDict

url = "https://painel.mailgrid.com.br/api/"

headers = CaseInsensitiveDict()
headers["Authorization"] = "Content-Type: application/json"
headers["Content-Type"] = "application/json"

data = """
{"host_smtp": "HOST-SMTP","usuario_smtp": "USUARIO-SMTP", "senha_smtp": "SENHA-SMTP", "emailRemetente": "EMAIL-REMETENTE", "nomeRemetente": "NOME-REMETENTE","emailDestino": ["postmaster@mailgrid.com.br","dev@mailgrid.com.br"], "assunto": "Teste de envio via API JSON",
"mensagem": "mensagem de teste da API JSON"}
"""


resp = requests.post(url, headers=headers, data=data)

print(resp.status_code)

