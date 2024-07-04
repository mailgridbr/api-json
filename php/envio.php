<?php
/////exemplo de envio php com API JSON MailGrid
$url = "https://api.mailgrid.net.br/send/";

$curl = curl_init($url);
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

$headers = array(
   "Authorization: Content-Type: application/json",
   "Content-Type: application/json",
);
curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

//Informe os dados fornecidos em sua conta MailGrid, como host, usuário e senha.
//Informe o remetente da mensagem (email e nome)
$data = <<<DATA
{"host_smtp": "HOST-SMTP","usuario_smtp": "USUARIO-SMTP", "senha_smtp": "SENHA-SMTP", "emailRemetente": "EMAIL-REMETENTE", "nomeRemetente": "NOME-REMETENTE","emailDestino": ["postmaster@mailgrid.com.br","dev@mailgrid.com.br"], "assunto": "Teste de envio via API JSON",
"mensagem": "mensagem de teste da API JSON"}
DATA;

curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

//for debug only!
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);

$resp = curl_exec($curl);
curl_close($curl);
var_dump($resp);

?>
