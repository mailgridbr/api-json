<?php

// Definição do endpoint da API
$url = "https://api.mailgrid.net.br/domain/add/";

// Dados de autenticação e domínio a ser adicionado
$data = [
	"token_auth" => "SEU_TOKEN_AQUI", // Token de autenticação obtido no painel do cliente
	"dominio" => "dominioaseradicionado.net.br" // Domínio a ser adicionado para envios
];

// Configuração da requisição cURL
$options = [
	CURLOPT_URL => $url, // URL do endpoint da API
	CURLOPT_RETURNTRANSFER => true, // Retorna a resposta como string
	CURLOPT_POST => true, // Método POST
	CURLOPT_HTTPHEADER => ["Content-Type: application/json"], // Define o cabeçalho da requisição
	CURLOPT_POSTFIELDS => json_encode($data), // Converte os dados para JSON antes de enviar
	CURLOPT_TIMEOUT => 30, // Tempo limite da requisição em segundos
	CURLOPT_SSL_VERIFYPEER => true // Mantém a verificação SSL ativada para segurança
];

// Inicializa o cURL
$ch = curl_init();
curl_setopt_array($ch, $options);
$response = curl_exec($ch); // Executa a requisição e captura a resposta
$statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); // Obtém o código de status HTTP

// Verifica se houve erro na requisição
if (curl_errno($ch)) {
	echo "Erro na requisição: " . curl_error($ch);
} elseif ($statusCode >= 400) {
	echo "Erro na requisição. Código de status HTTP: " . $statusCode;
} else {
	// Decodifica e exibe a resposta formatada em JSON
	$decodedResponse = json_decode($response, true);
	if (json_last_error() === JSON_ERROR_NONE) {
		echo "Resposta da API:\n";
		echo json_encode($decodedResponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
	} else {
		echo "Erro ao processar a resposta JSON.";
	}
}

// Fecha a conexão cURL
curl_close($ch);

?>
