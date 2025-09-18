require 'net/http'
require 'json'
require 'uri'

# Definição do endpoint da API
url = URI("https://api.mailgrid.net.br/consolidate/")

# Dados de autenticação e parâmetros de consulta
data = {
	"token_auth" => "INFORME-O-TOKEN-AQUI",  # Token de autenticação
	"dataini" => "2023-02-01",  # Data de início da consulta (AAAA-MM-DD)
	"horaini" => "00:01",  # Hora de início da consulta (HH:MM)
	"datafim" => "2023-08-30",  # Data de fim da consulta (AAAA-MM-DD)
	"horafim" => "23:59"  # Hora de fim da consulta (HH:MM)
}

# Configuração da requisição HTTP
http = Net::HTTP.new(url.host, url.port)
request = Net::HTTP::Post.new(url.path, {'Content-Type' => 'application/json'})
request.body = data.to_json  # Converte os dados para JSON antes de enviar

# Envia a requisição e obtém a resposta
response = http.request(request)

# Verifica o status da resposta
if response.code.to_i != 200
	# Se o código de status não for 200, houve um erro
	puts "Erro na requisição. Código de status HTTP: #{response.code}"
else
	# Caso a resposta seja bem-sucedida, decodifica e exibe o JSON
	begin
	decoded_response = JSON.parse(response.body)
	puts "Resposta da API:"
	puts JSON.pretty_generate(decoded_response)  # Exibe a resposta formatada
	rescue JSON::ParserError
	# Caso não consiga processar o JSON, exibe um erro
	puts "Erro ao processar a resposta JSON."
	end
end
