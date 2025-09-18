import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class mailgridConsolidate {
	public static void main(String[] args) {
		// Definindo o endpoint da API
		String url = "https://api.mailgrid.net.br/consolidate/";

		// Dados de autenticação e parâmetros de consulta
		String token_auth = "INFORME-O-TOKEN-AQUI"; // Token de autenticação
		String dataInicio = "2023-02-01"; // Data de início da consulta (AAAA-MM-DD)
		String horaInicio = "00:01"; // Hora de início da consulta (HH:MM)
		String dataFim = "2023-08-30"; // Data de fim da consulta (AAAA-MM-DD)
		String horaFim = "23:59"; // Hora de fim da consulta (HH:MM)

		// Criando o JSON de entrada
		String jsonInputString = "{"
				+ "\"token_auth\": \"" + token_auth + "\","
				+ "\"dataini\": \"" + dataInicio + "\","
				+ "\"horaini\": \"" + horaInicio + "\","
				+ "\"datafim\": \"" + dataFim + "\","
				+ "\"horafim\": \"" + horaFim + "\""
				+ "}";

		try {
			// Criando a URL e a conexão HTTP
			URL urlObj = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) urlObj.openConnection();
			connection.setRequestMethod("POST");

			// Definindo os cabeçalhos da requisição
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true); // Permite que dados sejam enviados no corpo da requisição

			// Enviando os dados JSON no corpo da requisição
			try (OutputStream os = connection.getOutputStream()) {
				byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
				os.write(input, 0, input.length); // Escreve os dados no corpo da requisição
			}

			// Obtendo o código de status da resposta
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
				if (statusCode == HttpURLConnection.HTTP_OK) {
					// Se o código de status for 200 (OK), exibe a resposta formatada
					System.out.println("Resposta da API: ");
					System.out.println(response.toString());
				} else {
					// Se o código de status for diferente de 200, exibe o erro
					System.out.println("Erro na requisição. Código de status HTTP: " + statusCode);
				}
			}
		} catch (IOException e) {
			// Caso ocorra um erro durante a requisição, exibe a mensagem de erro
			System.out.println("Erro na requisição: " + e.getMessage());
		}
	}
}
