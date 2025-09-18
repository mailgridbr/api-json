using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

class Program
{
	// Definição do endpoint da API
	private static string url = "https://api.mailgrid.net.br/domain/check/";

	static async Task Main(string[] args)
	{
		// Dados de autenticação e domínio a ser checado
		var data = new
		{
			token_auth = "SEU_TOKEN_AQUI", // Token de autenticação obtido no painel do cliente
			dominio = "dominioaserchecado.net.br" // Domínio a ser verificado
		};

		// Inicializa o HttpClient
		using (var client = new HttpClient())
		{
			// Configura o cabeçalho da requisição para JSON
			client.DefaultRequestHeaders.Add("Content-Type", "application/json");

			// Serializa o objeto de dados para JSON
			var jsonData = JsonConvert.SerializeObject(data);
			var content = new StringContent(jsonData, Encoding.UTF8, "application/json");

			try
			{
				// Envia a requisição POST
				HttpResponseMessage response = await client.PostAsync(url, content);

				// Obtém o código de status HTTP
				int statusCode = (int)response.StatusCode;
				Console.WriteLine($"Código de status: {statusCode}");

				// Verifica se a requisição foi bem-sucedida
				if (response.IsSuccessStatusCode)
				{
					// Lê a resposta como string
					string responseBody = await response.Content.ReadAsStringAsync();

					// Tenta desserializar a resposta JSON
					var decodedResponse = JsonConvert.DeserializeObject(responseBody);

					// Exibe a resposta formatada
					Console.WriteLine("Resposta da API:");
					string formattedResponse = 
					JsonConvert.SerializeObject(decodedResponse, Formatting.Indented);
					Console.WriteLine(formattedResponse);
				}
				else
				{
					// Exibe erro caso o código de status seja maior ou igual a 400
					Console.WriteLine($"Erro na requisição. Código de status: {statusCode}");
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
