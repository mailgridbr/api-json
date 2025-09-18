require 'net/http'
require 'json'
require 'uri'

# Definição do endpoint da API
url = URI("https://api.mailgrid.net.br/domain/list/")

# Dados de autenticação (substitua pelo seu token real)
data = {
	"token_auth" => "SEU_TOKEN_AQUI" # Token obtido no painel do cliente
}

# Configuração da requisição HTTP
http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Post.new(url.path, {'Content-Type' => 'application/json'})
request.body = data.to_json # Converte os dados para JSON antes de enviar

# Envia a requisição e obtém a resposta
response = http.request(request)

# Verifica o status da resposta
if response.code.to_i >= 400
	# Se o status for maior ou igual a 400, houve erro na requisição
	puts "Erro na requisição. Código de status HTTP: #{response.code}"
else
	# Caso a resposta seja bem-sucedida, decodifica e exibe o JSON
	begin
	decoded_response = JSON.parse(response.body)
	puts "Resposta da API:"
	puts JSON.pretty_generate(decoded_response) # Exibe a resposta formatada
	rescue JSON::ParserError
	# Caso não consiga processar o JSON, exibe um erro
	puts "Erro ao processar a resposta JSON."
	end
end
