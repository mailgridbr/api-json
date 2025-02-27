import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class MailGridReport {
    
    public static void main(String[] args) {
        // URL do endpoint da API para solicitar o relatório
        String apiUrl = "https://api.mailgrid.net.br/report/";

        // Dados a serem enviados no corpo da requisição (em formato JSON)
        String data = "{\n" +
                "    \"usuario_smtp\": \"USUARIO-SMTP\",\n" +
                "    \"senha_smtp\": \"SENHA-SMTP\",\n" +
                "    \"dataini\": \"2022-09-27\",\n" +
                "    \"horaini\": \"00:01\",\n" +
                "    \"datafim\": \"2022-09-27\",\n" +
                "    \"horafim\": \"23:59\"\n" +
                "}";

        try {
            // Criando a URL do endpoint e abrindo a conexão HTTP
            URL url = new URL(apiUrl);
            HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();

            // Configuração da requisição HTTP
            httpConnection.setRequestMethod("POST");
            httpConnection.setDoOutput(true); // Habilita o envio de dados no corpo da requisição
            httpConnection.setRequestProperty("Authorization", "Bearer YOUR_AUTH_TOKEN"); // Cabeçalho de autenticação (substitua YOUR_AUTH_TOKEN)
            httpConnection.setRequestProperty("Content-Type", "application/json");

            // Convertendo os dados JSON para um array de bytes
            byte[] out = data.getBytes(StandardCharsets.UTF_8);

            // Enviando os dados no corpo da requisição
            try (OutputStream os = httpConnection.getOutputStream()) {
                os.write(out); // Escreve os dados JSON no corpo da requisição
            }

            // Verificando o código de status HTTP da resposta
            int statusCode = httpConnection.getResponseCode();
            System.out.println("Código de Status: " + statusCode);

            // Lendo a resposta da API
            StringBuilder response = new StringBuilder();
            try (BufferedReader in = new BufferedReader(new InputStreamReader(httpConnection.getInputStream()))) {
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
            } catch (IOException e) {
                System.out.println("Erro ao ler a resposta da API: " + e.getMessage());
            }

            // Exibindo a resposta da API (caso o código de status seja 200)
            if (statusCode == HttpURLConnection.HTTP_OK) {
                System.out.println("Resposta da API:\n" + response.toString());
            } else {
                System.out.println("Erro: " + httpConnection.getResponseMessage());
            }

            // Fechando a conexão HTTP
            httpConnection.disconnect();

        } catch (IOException e) {
            // Exibindo erro caso a requisição falhe
            System.out.println("Erro na requisição HTTP: " + e.getMessage());
        }
    }
}
