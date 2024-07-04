URL url = new URL("https://api.mailgrid.net.br/report/");
HttpURLConnection http = (HttpURLConnection)url.openConnection();
http.setRequestMethod("POST");
http.setDoOutput(true);
http.setRequestProperty("Authorization", "Content-Type: application/json");
http.setRequestProperty("Content-Type", "application/json");

String data = "{\"usuario_smtp\": \"USUARIO-SMTP\", \"senha_smtp\": \"SENHA-SMTP\", \"dataini\": \"2022-09-27\", \"horaini\": \"00:01\", \"datafim\": \"2022-09-27\", \"horafim\": \"23:59\"}";

byte[] out = data.getBytes(StandardCharsets.UTF_8);

OutputStream stream = http.getOutputStream();
stream.write(out);

System.out.println(http.getResponseCode() + " " + http.getResponseMessage());
http.disconnect();
