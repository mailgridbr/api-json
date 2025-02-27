# Importa a biblioteca HTTParty para fazer requisições HTTP
require 'httparty'

# Define a URL da API como uma constante
API_URL = 'https://api.mailgrid.net.br/report/'

# Define os cabeçalhos da requisição
headers = {
  # No PHP, "Authorization: Content-Type: application/json" parece ser um erro
  # Corrigimos aqui usando apenas o Content-Type correto
  'Content-Type' => 'application/json'
}

# Cria o corpo da requisição como um hash Ruby
# Este hash será convertido automaticamente para JSON
body = {
  'usuario_smtp' => 'USUARIO-SMTP',    # Usuário para autenticação SMTP
  'senha_smtp' => 'SENHA-SMTP',        # Senha para autenticação SMTP
  'dataini' => '2022-09-27',          # Data inicial do relatório
  'horaini' => '00:01',               # Hora inicial do relatório
  'datafim' => '2022-09-27',          # Data final do relatório
  'horafim' => '23:59'                # Hora final do relatório
}

# Faz a requisição POST para a API
response = HTTParty.post(
  API_URL,
  headers: headers,           # Passa os cabeçalhos definidos
  body: body.to_json,         # Converte o hash para JSON e envia no corpo
  # Equivalente ao CURLOPT_SSL_VERIFYHOST e CURLOPT_SSL_VERIFYPEER como false
  # Usado apenas para debug, não recomendado em produção
  verify: false
)

# Exibe a resposta da API
# Similar ao var_dump do PHP, usamos inspect para uma saída detalhada
puts response.body.inspect
