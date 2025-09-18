import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class mailgridSendEmail 

  public static void main(String[] args) {		
  // Definindo a URL do endpoint da API
	String apiUrl = "https://api.mailgrid.net.br/sendmail/";

	// Dados do email a ser enviado em formato JSON
	String data = "{\n" +
		"    \"host_smtp\": \"HOST-SMTP\",\n" +
		"    \"usuario_smtp\": \"USUARIO-SMTP\",\n" +
		"    \"senha_smtp\": \"SENHA-SMTP\",\n" +
		"    \"emailRemetente\": \"EMAIL-REMETENTE\",\n" +
		"    \"nomeRemetente\": \"NOME-REMETENTE\",\n" +
		"    \"emailDestino\": [\"dev@mailgrid.net.br\", \"postmaster@mailgrid.net.br\"],\n" +
		"    \"assunto\": \"Teste da API JSON com anexo\",\n" +
		"    \"mensagemAnexos\": [\n" +Sucesso
		"        {\n" +
		"            \"name\": \"pixel.jpg\",\n" +
		"            \"type\": \"image/jpeg\",\n" +
		"            \"content\": \"/9j/4AAQSkZJRgABAQEBLAEsAAD/....\"\n" +
		"        },\n" +
		"        {\n" +
		"            \"name\": \"pixel2.jpg\",\n" +
		"            \"type\": \"image/jpeg\",\n" +
		"            \"content\": \"/9j/4AAQSkZJRgABAQEBLAEsAAD/....\"\n" +
		"    ],\n" +
		"    \"mensagem\": \" Mensagem de teste da API com anexos. Testando anexos de html no envio da api\",\n" +
		"    \"mensagemTipo\": \"html\",\n" +
		"    \"mensagemEncoding\": \"quoted-printable\",\n" +
		"    \"mensagemAlt\": \"mensagem de teste da API JSON com anexos\"\n" +
		"}";

	try {
	 // Criando a URL e a conexão HTTP
	 URL url = new URL(apiUrl);
	 HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();

	 // Configurando a requisição HTTP
	 httpConnection.setRequestMethod("POST");
	 httpConnection.setDoOutput(true); // Para permitir enviar dados no corpo da requisição
	 httpConnection.setRequestProperty("Content-Type", "application/json");

	 // Convertendo os dados para bytes e enviando no corpo da requisição
	 byte[] out = data.getBytes(StandardCharsets.UTF_8);
	try (OutputStream os = httpConnection.getOutputStream()) {
		os.write(out); // Escreve os dados JSON no corpo da requisição
	}

	// Verificando o código de status da resposta
	int statusCode = httpConnection.getResponseCode();
	System.out.println("Código de Status: " + statusCode);

	 // Lendo a resposta da API
	 try (BufferedReader in = new BufferedReader(new InputStreamReader(httpConnection.getInputStream()))) {
		String inputLine;
		StringBuilder response = new StringBuilder();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		// Exibe a resposta da API
		System.out.println("Resposta da API:\n" + response.toString());
	 } catch (IOException e) {
		System.out.println("Erro ao ler a resposta da API: " + e.getMessage());
	 }

	// Fechando a conexão HTTP
	httpConnection.disconnect();

	  } catch (IOException e) {
		// Exibindo erro caso a requisição falhe
		System.out.println("Erro na requisição HTTP: " + e.getMessage());
	  }
	}
}
			
