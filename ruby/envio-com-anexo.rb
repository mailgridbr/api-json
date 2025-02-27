# Importa a biblioteca HTTParty para fazer requisições HTTP
require 'httparty'

# Define a URL da API como uma constante para fácil manutenção
API_URL = 'https://api.mailgrid.net.br/send/'

# Define os cabeçalhos da requisição (headers)
headers = {
  'Content-Type' => 'application/json'  # Indica que o corpo da requisição é JSON
}

# Cria o corpo da requisição como um hash Ruby
# Este hash será automaticamente convertido para JSON pela biblioteca HTTParty
body = {
  # Configurações do servidor SMTP
  'host_smtp' => 'HOST-SMTP',          # Endereço do servidor SMTP
  'usuario_smtp' => 'USUARIO-SMTP',    # Usuário para autenticação SMTP
  'senha_smtp' => 'SENHA-SMTP',        # Senha para autenticação SMTP
  
  # Informações do remetente
  'emailRemetente' => 'EMAIL-REMETENTE',  # Email do remetente
  'nomeRemetente' => 'NOME-REMETENTE',    # Nome do remetente
  
  # Destinatários (array de emails)
  'emailDestino' => [
    'destinatario1@dominio.com.br',
    'destinatario2@dominio.com.br'
  ],
  
  # Assunto do email
  'assunto' => 'Teste de envio com anexo via API JSON',
  
  # Anexos da mensagem
  # Aqui definimos um arquivo de exemplo em base64
  'mensagemAnexos' => {
    'file1' => {
      'name' => 'anexoexemplo.pdf',           # Nome do arquivo
      'type' => 'application/pdf',           # Tipo MIME do arquivo
      'content' => 'UEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z'  # Conteúdo em base64
    }
  },
  
  # Conteúdo principal do email
  'mensagem' => '<h1>Mensagem de teste da API com anexo</h1> <p>Atenção, o arquivo codificado acima não funciona, é apenas um exemplo.</p>',
  
  # Tipo de formatação da mensagem
  'mensagemTipo' => 'html',          # Define que a mensagem é em formato HTML
  
  # Codificação da mensagem
  'mensagemEncoding' => 'base64',    # Define a codificação como base64
  
  # Versão alternativa da mensagem em texto puro
  'mensagemAlt' => 'Mensagem de teste da API com anexo. >Atenção, o arquivo codificado acima não funciona, é apenas um exemplo.'
}

# Faz a requisição POST para a API
# O HTTParty converte automaticamente o hash para JSON
response = HTTParty.post(
  API_URL,
  headers: headers,     # Passa os cabeçalhos definidos
  body: body.to_json,   # Converte o hash para JSON e envia no corpo
  timeout: 0,          # Sem timeout (equivalente ao CURLOPT_TIMEOUT => 0)
  follow_redirects: true  # Segue redirecionamentos automaticamente
)

# Exibe a resposta da API
puts response.body
