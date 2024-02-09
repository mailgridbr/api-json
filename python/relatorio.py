import requests
from requests.structures import CaseInsensitiveDict

url = "https://painel.mailgrid.com.br/api/report/"

headers = CaseInsensitiveDict()
headers["Authorization"] = "Content-Type: application/json"
headers["Content-Type"] = "application/json"

data = '{"usuario_smtp": "USUARIO-SMTP", "senha_smtp": "SENHA-SMTP", "dataini": "2022-09-27", "horaini": "00:01", "datafim": "2022-09-27", "horafim": "23:59"}'


resp = requests.post(url, headers=headers, data=data)

print(resp.status_code)
