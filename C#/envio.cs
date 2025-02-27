using System;
using System.IO;
using System.Net;
using System.Text;

class Program
{
    static void Main()
    {
        // URL do endpoint da API
        var url = "https://api.mailgrid.net.br/send/";

        try
        {
            // Criação da requisição HTTP POST
            var httpRequest = (HttpWebRequest)WebRequest.Create(url);
            httpRequest.Method = "POST";

            // Definindo os cabeçalhos da requisição
            httpRequest.Headers["Authorization"] = "Bearer SEU_TOKEN"; // Corrigido para Bearer Token (se necessário)
            httpRequest.ContentType = "application/json"; // Especificando o tipo do conteúdo

            // Dados da requisição, que serão enviados no corpo da requisição
            var data = @"{
                            ""host_smtp"": ""HOST-SMTP"",
                            ""usuario_smtp"": ""USUARIO-SMTP"",
                            ""senha_smtp"": ""SENHA-SMTP"",
                            ""emailRemetente"": ""EMAIL-REMETENTE"",
                            ""nomeRemetente"": ""NOME-REMETENTE"",
                            ""emailDestino"": [""postmaster@mailgrid.com.br"", ""dev@mailgrid.com.br""],
                            ""assunto"": ""Teste de envio via API JSON"",
                            ""mensagem"": ""mensagem de teste da API JSON""
                        }";

            // Escrevendo os dados no corpo da requisição
            using (var streamWriter = new StreamWriter(httpRequest.GetRequestStream(), Encoding.UTF8))
            {
                streamWriter.Write(data);
            }

            // Obtenção da resposta HTTP
            using (var httpResponse = (HttpWebResponse)httpRequest.GetResponse())
            {
                // Lê o conteúdo da resposta
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    var result = streamReader.ReadToEnd();
                    Console.WriteLine($"Resposta da API: {result}");
                }

                // Exibe o código de status da resposta HTTP
                Console.WriteLine($"Código de status: {httpResponse.StatusCode}");
            }
        }
        catch (WebException webEx)
        {
            // Captura falhas de requisição, como erros de rede, URL incorreta ou erro no servidor
            using (var streamReader = new StreamReader(webEx.Response.GetResponseStream()))
            {
                var errorResponse = streamReader.ReadToEnd();
                Console.WriteLine($"Erro na requisição: {errorResponse}");
            }
        }
        catch (Exception ex)
        {
            // Captura outros tipos de exceções
            Console.WriteLine($"Erro inesperado: {ex.Message}");
        }
    }
}
