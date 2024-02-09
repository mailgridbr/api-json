URL url = new URL("https://painel.mailgrid.com.br/api/send/");
HttpURLConnection http = (HttpURLConnection)url.openConnection();
http.setRequestMethod("POST");
http.setDoOutput(true);
http.setRequestProperty("Content-Type", "application/json");

String data = "{\n    \"host_smtp\": \"HOST-SMTP\",\n    \"usuario_smtp\": \"USUARIO-SMTP\", \n    \"senha_smtp\": \"SENHA-SMTP\", \n    \"emailRemetente\": \"EMAIL-REMETENTE\", \n    \"nomeRemetente\": \"NOME-REMETENTE\",\n    \"emailDestino\": [\"dev@mailgrid.com.br\",\"postmaster@mailgrid.com.br\"], \n    \"assunto\": \"Teste da API JSON com anexo\",\n    \"mensagemAnexos\": {\"file1\": {\"name\": \"pixel.jpg\", \"type\": \"image/jpeg\", \"content\": \"/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAb/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAf/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCNVJaAAAAAAAAH/9k=\"}, \"file2\": {\"name\": \"pixel2.jpg\", \"type\": \"image/jpeg\", \"content\": \"/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAP/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z\"}},\n    \"mensagem\": \"<h1>Mensagem de teste da API com anexos</h1> <p>Testando anexos de <b>html</b> no envio da api</p>\",\n    \"mensagemTipo\": \"html\",\n    \"mensagemEncoding\": \"quoted-printable\",\n    \"mensagemAlt\": \"mensagem de teste da API JSON com anexos\"\n    }";

byte[] out = data.getBytes(StandardCharsets.UTF_8);

OutputStream stream = http.getOutputStream();
stream.write(out);

System.out.println(http.getResponseCode() + " " + http.getResponseMessage());
http.disconnect();

