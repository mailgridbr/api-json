<?php

// Definição do endpoint da API
$url = "https://api.mailgrid.net.br/domain/check/";

// Dados de autenticação e domínio a ser checado
$data = [
    "token_auth" => "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", // Token de autenticação obtido no painel do cliente
    "dominio" => "dominioaserchecado.net.br" // Domínio a ser verificado
];

// Configuração da requisição cURL
$options = [
    CURLOPT_URL => $url, // Define a URL do endpoint da API
    CURLOPT_RETURNTRANSFER => true, // Retorna a resposta como string em vez de exibi-la diretamente
    CURLOPT_POST => true, // Define o método da requisição como POST
    CURLOPT_HTTPHEADER => ["Content-Type: application/json"], // Define o cabeçalho da requisição como JSON
    CURLOPT_POSTFIELDS => json_encode($data), // Converte os dados para JSON antes de enviar
    CURLOPT_TIMEOUT => 30, // Define o tempo limite da requisição em segundos
    CURLOPT_SSL_VERIFYPEER => true // Mantém a verificação SSL ativada para segurança
];

// Inicializa o cURL
$ch = curl_init();
curl_setopt_array($ch, $options);
$response = curl_exec($ch); // Executa a requisição e captura a resposta
$statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); // Obtém o código de status HTTP da resposta

// Verifica se houve erro na requisição
if (curl_errno($ch)) {
    // Exibe o erro ocorrido na requisição
    echo "Erro na requisição: " . curl_error($ch);
} elseif ($statusCode >= 400) {
    // Exibe o código de status HTTP caso ocorra erro
    echo "Erro na requisição. Código de status HTTP: " . $statusCode;
} else {
    // Decodifica a resposta JSON para um array associativo
    $decodedResponse = json_decode($response, true);
    
    // Verifica se a resposta foi decodificada corretamente
    if (json_last_error() === JSON_ERROR_NONE) {
        echo "Resposta da API:\n";
        // Exibe a resposta formatada em JSON de forma legível
        echo json_encode($decodedResponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    } else {
        // Mensagem de erro caso a resposta JSON não possa ser processada
        echo "Erro ao processar a resposta JSON.";
    }
}

// Fecha a conexão cURL
curl_close($ch);

?>

