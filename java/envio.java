import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class SendEmailViaAPI {
    
    public static void main(String[] args) {
        // URL do endpoint da API
        String apiUrl = "https://api.mailgrid.net.br/send/";

        // Dados a serem enviados no corpo da requisição, em formato JSON
        String data = "{\n" +
                "    \"host_smtp\": \"HOST-SMTP\",\n" +
                "    \"usuario_smtp\": \"USUARIO-SMTP\",\n" +
                "    \"senha_smtp\": \"SENHA-SMTP\",\n" +
                "    \"emailRemetente\": \"EMAIL-REMETENTE\",\n" +
                "    \"nomeRemetente\": \"NOME-REMETENTE\",\n" +
                "    \"emailDestino\": [\"postmaster@mailgrid.com.br\", \"dev@mailgrid.com.br\"],\n" +
                "    \"assunto\": \"Teste de envio via API JSON\",\n" +
                "    \"mensagem\": \"mensagem de teste da API JSON\"\n" +
                "}";

        try {
            // Criando a URL do endpoint e abrindo a conexão HTTP
            URL url = new URL(apiUrl);
            HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();

            // Configurando a requisição HTTP
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
            try (BufferedReader in = new BufferedReader(new InputStreamReader(httpConnection.getInputStream()))) {
                String inputLine;
                StringBuilder response = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                // Exibindo a resposta da API
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
