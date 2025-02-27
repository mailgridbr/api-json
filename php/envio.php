<?php
///// Exemplo de envio PHP com API JSON MailGrid

// Define a URL da API do MailGrid
$url = "https://api.mailgrid.net.br/send/";

// Inicializa a sessão cURL com a URL da API
$curl = curl_init($url);

// Define a URL para a requisição
curl_setopt($curl, CURLOPT_URL, $url);

// Define o método de requisição como POST
curl_setopt($curl, CURLOPT_POST, true);

// Faz com que o cURL retorne a resposta como uma string
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

// Define os cabeçalhos HTTP para a requisição
$headers = array(
   "Authorization: Content-Type: application/json", // Cabeçalho de autorização (caso seja necessário autenticação)
   "Content-Type: application/json", // Especifica que o corpo da requisição está em JSON
);
curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

// Cria os dados a serem enviados, utilizando json_encode para transformar em JSON
// Substitua os valores abaixo pelos dados reais fornecidos pelo MailGrid
$data = json_encode(array(
    "host_smtp" => "HOST-SMTP", // Informe o seu servidor SMTP
    "usuario_smtp" => "USUARIO-SMTP", // Informe seu usuário SMTP
    "senha_smtp" => "SENHA-SMTP", // Informe a senha do seu SMTP
    "emailRemetente" => "EMAIL-REMETENTE", // Informe o email do remetente
    "nomeRemetente" => "NOME-REMETENTE", // Informe o nome do remetente
    "emailDestino" => array("postmaster@mailgrid.com.br", "dev@mailgrid.com.br"), // Emails dos destinatários
    "assunto" => "Teste de envio via API JSON", // Assunto do email
    "mensagem" => "Mensagem de teste da API JSON" // Corpo da mensagem
));

// Define os dados (corpo) da requisição POST
curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

// Configurações para debug (apenas para desenvolvimento)
// Desativa a verificação do host e do peer SSL (útil para evitar erros de certificado durante o desenvolvimento)
// **Nunca use isso em produção, pois pode causar falhas de segurança**.
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);

// Executa a requisição cURL e armazena a resposta
$resp = curl_exec($curl);

// Fecha a sessão cURL
curl_close($curl);

// Exibe a resposta para depuração (ideal para testar o que a API retorna)
var_dump($resp);
?>
