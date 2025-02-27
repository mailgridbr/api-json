# Importa a biblioteca HTTParty para fazer requisições HTTP
require 'httparty'

# Define a URL da API como uma constante
API_URL = 'https://api.mailgrid.net.br/send/'

# Define os cabeçalhos da requisição
headers = {
  # No PHP, "Authorization: Content-Type: application/json" parece ser um erro de formatação
  # Corrigimos aqui usando apenas o Content-Type correto
  'Content-Type' => 'application/json'
}

# Cria o corpo da requisição como um hash Ruby
# Os dados serão convertidos automaticamente para JSON
body = {
  # Configurações do servidor SMTP
  'host_smtp' => 'HOST-SMTP',          # Endereço do servidor SMTP
  'usuario_smtp' => 'USUARIO-SMTP',    # Usuário para autenticação SMTP
  'senha_smtp' => 'SENHA-SMTP',        # Senha para autenticação SMTP
  
  # Informações do remetente
  'emailRemetente' => 'EMAIL-REMETENTE',  # Email do remetente
  'nomeRemetente' => 'NOME-REMETENTE',    # Nome do remetente
  
  # Lista de emails de destino (array)
  'emailDestino' => [
    'postmaster@mailgrid.com.br',
    'dev@mailgrid.com.br'
  ],
  
  # Assunto e corpo da mensagem
  'assunto' => 'Teste de envio via API JSON',      # Assunto do email
  'mensagem' => 'Mensagem de teste da API JSON'    # Conteúdo do email
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
# Em Ruby, `puts` com `inspect` é similar ao `var_dump` do PHP
puts response.body.inspect
