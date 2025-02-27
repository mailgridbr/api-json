<?php

// Definição do endpoint da API para listar domínios
$url = "https://api.mailgrid.net.br/domain/list/";

// Dados de autenticação (substitua pelo seu token real)
$data = [
    "token_auth" => "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" // Token obtido no painel do cliente
];

// Configuração da requisição cURL
$options = [
    CURLOPT_URL => $url, // Define a URL do endpoint da API
    CURLOPT_RETURNTRANSFER => true, // Retorna a resposta como string
    CURLOPT_POST => true, // Define o método da requisição como POST
    CURLOPT_HTTPHEADER => ["Content-Type: application/json"], // Define o cabeçalho da requisição como JSON
    CURLOPT_POSTFIELDS => json_encode($data), // Converte os dados para JSON antes de enviar
    CURLOPT_TIMEOUT => 30, // Tempo limite da requisição em segundos
    CURLOPT_SSL_VERIFYPEER => true // Mantém a verificação SSL ativada para segurança
];

// Inicializa o cURL
$ch = curl_init();
curl_setopt_array($ch, $options);
$response = curl_exec($ch); // Executa a requisição e captura a resposta
$statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); // Obtém o código de status HTTP da resposta

// Verifica se houve erro na requisição
if (curl_errno($ch)) {
    echo "Erro na requisição: " . curl_error($ch); // Exibe a mensagem de erro do cURL
} elseif ($statusCode >= 400) {
    echo "Erro na requisição. Código de status HTTP: " . $statusCode; // Exibe o código de erro HTTP
} else {
    // Decodifica a resposta JSON para um array associativo
    $decodedResponse = json_decode($response, true);
    
    // Verifica se a resposta foi decodificada corretamente
    if (json_last_error() === JSON_ERROR_NONE) {
        echo "Resposta da API:\n";
        echo json_encode($decodedResponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE); // Exibe a resposta formatada
    } else {
        echo "Erro ao processar a resposta JSON."; // Mensagem de erro caso a resposta JSON seja inválida
    }
}

// Fecha a conexão cURL para liberar recursos
curl_close($ch);

?>

