<?php

 // Defina a URL da API do mailgrid para obter relatórios
 $url = "https://api.mailgrid.net.br/report/";

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
 "Content-Type: application/json", // Especifica que o corpo da requisição está em JSON
 );

 // Define os cabeçalhos para a requisição cURL
 curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);

 // Dados que serão enviados no corpo da requisição, em formato JSON.
 // O JSON contém informações sobre o usuário, a senha e o intervalo de tempo para o relatório.
 $data = '{"token_auth": "INFORME-O-TOKEN-AQUI", "dataini": "2022-09-27", "horaini": "00:01", "datafim": "2022-09-27", 
 "horafim": "23:59"}';

 // Define os dados do corpo da requisição POST
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
