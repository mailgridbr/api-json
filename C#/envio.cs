var url = "https://painel.mailgrid.com.br/api/";

var httpRequest = (HttpWebRequest)WebRequest.Create(url);
httpRequest.Method = "POST";

httpRequest.Headers["Authorization"] = "Content-Type: application/json";
httpRequest.ContentType = "application/json";

var data = @"{""host_smtp"": ""HOST-SMTP"",""usuario_smtp"": ""USUARIO-SMTP"", ""senha_smtp"": ""SENHA-SMTP"", ""emailRemetente"": ""EMAIL-REMETENTE"", ""nomeRemetente"": ""NOME-REMETENTE"",""emailDestino"": [""postmaster@mailgrid.com.br"",""dev@mailgrid.com.br""], ""assunto"": ""Teste de envio via API JSON"",
""mensagem"": ""mensagem de teste da API JSON""}";

using (var streamWriter = new StreamWriter(httpRequest.GetRequestStream()))
{
   streamWriter.Write(data);
}

var httpResponse = (HttpWebResponse)httpRequest.GetResponse();
using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
{
   var result = streamReader.ReadToEnd();
}

Console.WriteLine(httpResponse.StatusCode);
