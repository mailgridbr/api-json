<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://api.mailgrid.net.br/send/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "host_smtp": "HOST-SMTP",
    "usuario_smtp": "USUARIO-SMTP", 
    "senha_smtp": "SENHA-SMTP", 
    "emailRemetente": "EMAIL-REMETENTE", 
    "nomeRemetente": "NOME-REMETENTE",
    "emailDestino": ["destinatario1@dominio.com.br","destinatario2@dominio.com.br"], 
    "assunto": "Teste de envio com anexo via API JSON",
    "mensagemAnexos": {"file1": {"name": "anexoexemplo.pdf", "type": "application/pdf", "content": "UEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z"}},
    "mensagem": "<h1>Mensagem de teste da API com anexo</h1> <p>Atenção, o arquivo codificado acima não funciona, é apenas um exemplo.</p>",
    "mensagemTipo": "html",
    "mensagemEncoding": "base64",
    "mensagemAlt": "Mensagem de teste da API com anexo. >Atenção, o arquivo codificado acima não funciona, é apenas um exemplo."
    }',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;
?>
