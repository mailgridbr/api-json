using System;
using System.IO;
using System.Net;
using System.Text;

class Program
{
    static void Main()
    {
        // URL do endpoint da API
        var url = "https://api.mailgrid.net.br/report/";

        try
        {
            // Criação da requisição HTTP POST
            var httpRequest = (HttpWebRequest)WebRequest.Create(url);
            httpRequest.Method = "POST";

            // Definindo os cabeçalhos da requisição
            httpRequest.Headers["Authorization"] = "Bearer SEU_TOKEN_AQUI"; // Cabeçalho de Autorização (caso necessário)
            httpRequest.ContentType = "application/json"; // Especificando que o conteúdo é JSON

            // Dados da requisição (parâmetros de consulta para o relatório)
            var data = "{\"usuario_smtp\": \"USUARIO-SMTP\", \"senha_smtp\": \"SENHA-SMTP\", " +
                       "\"dataini\": \"2022-09-27\", \"horaini\": \"00:01\", \"datafim\": \"2022-09-27\", \"horafim\": \"23:59\"}";

            // Escrevendo os dados no corpo da requisição
            using (var streamWriter = new StreamWriter(httpRequest.GetRequestStream(), Encoding.UTF8))
            {
                streamWriter.Write(data); // Envia os dados JSON como corpo da requisição
            }

            // Obtenção da resposta HTTP
            using (var httpResponse = (HttpWebResponse)httpRequest.GetResponse())
            {
                // Verificando se a resposta HTTP foi bem-sucedida
                if (httpResponse.StatusCode == HttpStatusCode.OK)
                {
                    // Lê o conteúdo da resposta
                    using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                    {
                        var result = streamReader.ReadToEnd();
                        Console.WriteLine("Resposta da API:\n" + result); // Exibe a resposta da API
                    }
                }
                else
                {
                    Console.WriteLine($"Erro na requisição. Código de status HTTP: {httpResponse.StatusCode}");
                }
            }
        }
        catch (WebException webEx)
        {
            // Captura falhas de requisição, como erros de rede ou de resposta HTTP
            using (var streamReader = new StreamReader(webEx.Response.GetResponseStream()))
            {
                var errorResponse = streamReader.ReadToEnd();
                Console.WriteLine($"Erro na requisição: {errorResponse}");
            }
        }
        catch (Exception ex)
        {
            // Captura outros tipos de exceções, como problemas gerais
            Console.WriteLine($"Erro inesperado: {ex.Message}");
        }
    }
}
