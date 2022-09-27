var url = "https://painel.mailgrid.com.br/api/report.php";

var httpRequest = (HttpWebRequest)WebRequest.Create(url);
httpRequest.Method = "POST";

httpRequest.Headers["Authorization"] = "Content-Type: application/json";
httpRequest.ContentType = "application/json";

var data = "{\"usuario_smtp\": \"USUARIO-SMTP\", \"senha_smtp\": \"SENHA-SMTP\", \"dataini\": \"2022-09-27\", \"horaini\": \"00:01\", \"datafim\": \"2022-09-27\", \"horafim\": \"23:59\"}";

using (var streamWriter = new StreamWriter(httpRequest.GetRequestStream()))
{
   streamWriter.Write(data);
}

var httpResponse = (HttpWebResponse)httpRequest.GetResponse();
using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
{
   var result = streamReader.ReadToEnd();
}
