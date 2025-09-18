
require 'net/http'
require 'json'
require 'uri'

# Definição da URL do endpoint da API
url = URI.parse("https://api.mailgrid.net.br/domain/add/")

# Dados de autenticação e domínio a ser adicionado
data = {
	"token_auth" => "SEU_TOKEN_AQUI", # Token de autenticação obtido no painel do cliente
	"dominio" => "dominioaseradicionado.net.br" # Domínio a ser adicionado
}

# Configura a requisição HTTP
http = Net::HTTP.new(url.host, url.port)

# Cria o objeto de requisição POST
request = Net::HTTP::Post.new(url.path, {'Content-Type' => 'application/json'})
request.body = data.to_json # Converte os dados para JSON e coloca no corpo da requisição

# Configura o tempo de timeout
http.read_timeout = 30 # Tempo limite para a requisição em segundos

begin
	# Envia a requisição para o servidor
	response = http.request(request)

	# Verifica o código de status da resposta HTTP
	if response.code.to_i >= 400
	puts "Erro na requisição. Código de status HTTP: #{response.code}"
	else
	# Decodifica a resposta JSON
	parsed_response = JSON.parse(response.body)

	# Verifica se a resposta foi decodificada corretamente
	if parsed_response.is_a?(Hash)
		puts "Resposta da API:"
		puts JSON.pretty_generate(parsed_response) # Exibe a resposta formatada em JSON
	else
		puts "Erro ao processar a resposta JSON."
	end
	end
rescue StandardError => e
	# Captura erros como problemas de conexão ou tempo limite
	puts "Erro na requisição: #{e.message}"
end
