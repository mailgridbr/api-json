URL url = new URL("https://painel.mailgrid.com.br/api/send/");
HttpURLConnection http = (HttpURLConnection)url.openConnection();
http.setRequestMethod("POST");
http.setDoOutput(true);
http.setRequestProperty("Authorization", "Content-Type: application/json");
http.setRequestProperty("Content-Type", "application/json");

String data = "{\"host_smtp\": \"HOST-SMTP\",\"usuario_smtp\": \"USUARIO-SMTP\", \"senha_smtp\": \"SENHA-SMTP\", \"emailRemetente\": \"EMAIL-REMETENTE\", \"nomeRemetente\": \"NOME-REMETENTE\",\"emailDestino\": [\"postmaster@mailgrid.com.br\",\"dev@mailgrid.com.br\"], \"assunto\": \"Teste de envio via API JSON\",\n\"mensagem\": \"mensagem de teste da API JSON\"}";

byte[] out = data.getBytes(StandardCharsets.UTF_8);

OutputStream stream = http.getOutputStream();
stream.write(out);

System.out.println(http.getResponseCode() + " " + http.getResponseMessage());
http.disconnect();

