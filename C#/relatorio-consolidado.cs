using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

class Program
{
    // Definição do endpoint da API
    private static string url = "https://api.mailgrid.net.br/consolidate/";

    static async Task Main(string[] args)
    {
        // Dados de autenticação e parâmetros de consulta
        var data = new
        {
            usuario_smtp = "smtp1@seudominio.com.br", // Usuário SMTP para autenticação
            senha_smtp = "xxxxxxxx", // Senha SMTP para autenticação
            dataini = "2023-02-01", // Data de início da consulta (AAAA-MM-DD)
            horaini = "00:01", // Hora de início da consulta (HH:MM)
            datafim = "2023-08-30", // Data de fim da consulta (AAAA-MM-DD)
            horafim = "23:59" // Hora de fim da consulta (HH:MM)
        };

        // Inicializa o HttpClient
        using (var client = new HttpClient())
        {
            // Configura o cabeçalho da requisição para JSON
            client.DefaultRequestHeaders.Add("Content-Type", "application/json");

            // Serializa os dados para JSON
            var jsonData = JsonConvert.SerializeObject(data);
            var content = new StringContent(jsonData, Encoding.UTF8, "application/json");

            try
            {
                // Envia a requisição POST
                HttpResponseMessage response = await client.PostAsync(url, content);

                // Obtém o código de status HTTP
                int statusCode = (int)response.StatusCode;
                Console.WriteLine($"Código de status: {statusCode}");

                // Verifica se a requisição foi bem-sucedida (código 2xx)
                if (response.IsSuccessStatusCode)
                {
                    // Lê a resposta como string
                    string responseBody = await response.Content.ReadAsStringAsync();

                    // Tenta desserializar a resposta JSON
                    var decodedResponse = JsonConvert.DeserializeObject(responseBody);

                    // Exibe a resposta formatada em JSON
                    Console.WriteLine("Resposta da API:");
                    string formattedResponse = JsonConvert.SerializeObject(decodedResponse, Formatting.Indented);
                    Console.WriteLine(formattedResponse);
                }
                else
                {
                    // Exibe erro caso o código de status seja maior ou igual a 400
                    Console.WriteLine($"Erro na requisição. Código de status HTTP: {statusCode}");
                }
            }
            catch (Exception ex)
            {
                // Exibe qualquer erro durante a requisição
                Console.WriteLine($"Erro ao processar a requisição: {ex.Message}");
            }
        }
    }
}
