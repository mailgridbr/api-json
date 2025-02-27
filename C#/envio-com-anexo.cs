using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

class Program
{
    // URL do endpoint da API
    private static readonly string apiUrl = "https://api.mailgrid.net.br/send/";

    // Método principal assíncrono
    static async Task Main(string[] args)
    {
        // Cria a instância do HttpClient
        using (var client = new HttpClient())
        {
            // Cria a requisição HTTP com o método POST para a URL do endpoint
            var request = new HttpRequestMessage(HttpMethod.Post, apiUrl);

            // Dados do corpo da requisição, incluindo as informações do e-mail e anexos
            var jsonContent = "{\r\n" +
                              "    \"host_smtp\": \"HOST-SMTP\",\r\n" +
                              "    \"usuario_smtp\": \"USUARIO-SMTP\",\r\n" +
                              "    \"senha_smtp\": \"SENHA-SMTP\",\r\n" +
                              "    \"emailRemetente\": \"EMAIL-REMETENTE\",\r\n" +
                              "    \"nomeRemetente\": \"NOME-REMETENTE\",\r\n" +
                              "    \"emailDestino\": [\"dev@mailgrid.com.br\",\"postmaster@mailgrid.com.br\"],\r\n" +
                              "    \"assunto\": \"Teste da API JSON com anexo\",\r\n" +
                              "    \"mensagemAnexos\": {\r\n" +
                              "        \"file1\": {\r\n" +
                              "            \"name\": \"pixel.jpg\",\r\n" +
                              "            \"type\": \"image/jpeg\",\r\n" +
                              "            \"content\": \"/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAb/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAf/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCNVJaAAAAAAAAH/9k=\"\r\n" +
                              "        },\r\n" +
                              "        \"file2\": {\r\n" +
                              "            \"name\": \"pixel2.jpg\",\r\n" +
                              "            \"type\": \"image/jpeg\",\r\n" +
                              "            \"content\": \"/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAP/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z\"\r\n" +
                              "    },\r\n" +
                              "    \"mensagem\": \"<h1>Mensagem de teste da API com anexos</h1> <p>Testando anexos de <b>html</b> no envio da api</p>\",\r\n" +
                              "    \"mensagemTipo\": \"html\",\r\n" +
                              "    \"mensagemEncoding\": \"quoted-printable\",\r\n" +
                              "    \"mensagemAlt\": \"mensagem de teste da API JSON com anexos\"\r\n" +
                              "    }";

            // Define o conteúdo da requisição como JSON
            var content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

            // Adiciona o conteúdo ao corpo da requisição
            request.Content = content;

            try
            {
                // Envia a requisição HTTP de forma assíncrona
                var response = await client.SendAsync(request);

                // Garante que a resposta tenha sido bem-sucedida (código de status 2xx)
                response.EnsureSuccessStatusCode();

                // Exibe o conteúdo da resposta da API
                Console.WriteLine("Resposta da API:");
                string responseContent = await response.Content.ReadAsStringAsync();
                Console.WriteLine(responseContent);
            }
            catch (HttpRequestException ex)
            {
                // Trata erros de requisição HTTP (como problemas de conexão ou falhas no servidor)
                Console.WriteLine($"Erro ao fazer a requisição: {ex.Message}");
            }
            catch (Exception ex)
            {
                // Trata outros tipos de exceção
                Console.WriteLine($"Erro inesperado: {ex.Message}");
            }
        }
    }
}
