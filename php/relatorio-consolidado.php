<?php

// Definição do endpoint da API
$url = "https://api.mailgrid.net.br/consolidate/";

// Dados de autenticação e parâmetros de consulta
$data = [
    "token_auth" => "INFORME-O-TOKEN-AQUI", // Token de autenticação
    "dataini" => "2023-02-01", // Data de início da consulta (AAAA-MM-DD)
    "horaini" => "00:01", // Hora de início da consulta (HH:MM)
    "datafim" => "2023-08-30", // Data de fim da consulta (AAAA-MM-DD)
    "horafim" => "23:59" // Hora de fim da consulta (HH:MM)
];

// Configuração da requisição cURL
$options = [
    CURLOPT_URL => $url, // URL do endpoint
    CURLOPT_RETURNTRANSFER => true, // Retorna a resposta como string
    CURLOPT_POST => true, // Método POST
    CURLOPT_HTTPHEADER => ["Content-Type: application/json"], // Define o cabeçalho da requisição
    CURLOPT_POSTFIELDS => json_encode($data), // Converte os dados para JSON antes de enviar
    CURLOPT_TIMEOUT => 30, // Tempo limite da requisição em segundos
    CURLOPT_SSL_VERIFYPEER => false // Desativar verificação SSL caso necessário
];

// Inicializa o cURL e executa a requisição
$ch = curl_init();
curl_setopt_array($ch, $options);
$response = curl_exec($ch); // Executa a requisição e armazena a resposta
$statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); // Obtém o código de status HTTP

// Verifica se houve erro na requisição
if (curl_errno($ch)) {
    echo "Erro na requisição: " . curl_error($ch); // Exibe mensagem de erro se houver falha no cURL
} elseif ($statusCode !== 200) {
    echo "Erro na requisição. Código de status HTTP: " . $statusCode; // Exibe erro baseado no código de status
} else {
    // Exibe a resposta formatada em JSON
    echo "Resposta da API:\n";
    echo json_encode(json_decode($response, true), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
}

// Fecha a conexão cURL
curl_close($ch);

?>
