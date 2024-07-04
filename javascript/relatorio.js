var url = "https://api.mailgrid.net.br/report/";

var xhr = new XMLHttpRequest();
xhr.open("POST", url);

xhr.setRequestHeader("Authorization", "Content-Type: application/json");
xhr.setRequestHeader("Content-Type", "application/json");

xhr.onreadystatechange = function () {
   if (xhr.readyState === 4) {
      console.log(xhr.status);
      console.log(xhr.responseText);
   }};

var data = '{"usuario_smtp": "USUARIO-SMTP", "senha_smtp": "SENHA-SMTP", "dataini": "2022-09-27", "horaini": "00:01", "datafim": "2022-09-27", "horafim": "23:59"}';

xhr.send(data);
