import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class mailgridApiExample {
	public static void main(String[] args) {
		// Definindo a URL do endpoint da API
		String url = "https://api.mailgrid.net.br/domain/add/";

		// Dados de autenticação e domínio a ser adicionado (substitua com seus dados reais)
		String tokenAuth = "SEU_TOKEN_AQUI"; // Token de autenticação
		String dominio = "dominioaseradicionado.net.br"; // Domínio a ser adicionado

		// JSON com os dados para envio
		String jsonInputString = "{"
				+ "\"token_auth\": \"" + tokenAuth + "\","
				+ "\"dominio\": \"" + dominio + "\""
				+ "}";

		try {
			// Criando um objeto URL a partir do endpoint da API
			URL urlObj = new URL(url);
			// Abrindo uma conexão HTTP com o método POST
			HttpURLConnection connection = (HttpURLConnection) urlObj.openConnection();
			connection.setRequestMethod("POST");
			
			// Definindo os cabeçalhos da requisição
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true); // Permitindo que o corpo da requisição seja enviado

			// Enviando os dados (JSON) para o corpo da requisição
			try (OutputStream os = connection.getOutputStream()) {
				byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
				os.write(input, 0, input.length); // Escreve os dados no corpo da requisição
			}

			// Obtendo o código de resposta HTTP
			int statusCode = connection.getResponseCode();

			// Lendo a resposta da API
			try (BufferedReader br = 
			new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
				StringBuilder response = new StringBuilder();
				String line;
				while ((line = br.readLine()) != null) {
					response.append(line);
				}

				// Verificando o código de status e exibindo a resposta
				if (statusCode >= 200 && statusCode < 300) {
					// Se o código de status for 2xx, a requisição foi bem-sucedida
					System.out.println("Resposta da API: ");
					System.out.println(response.toString());
				} else {
					// Se o código de status for maior ou igual a 400, ocorreu um erro
					System.out.println("Erro na requisição. Código de status HTTP: " + statusCode);
				}
			}
		} catch (IOException e) {
			// Caso ocorra algum erro na requisição, exibe a mensagem de erro
			System.out.println("Erro na requisição: " + e.getMessage());
		}
	}
}
