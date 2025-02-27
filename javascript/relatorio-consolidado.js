// Importa o módulo https nativo do Node.js para realizar requisições HTTPS
const https = require('https');

// Definição do endpoint da API
const url = "https://api.mailgrid.net.br/consolidate/";

// Dados de autenticação e parâmetros de consulta
const data = JSON.stringify({
    "usuario_smtp": "smtp1@seudominio.com.br", // Usuário SMTP para autenticação
    "senha_smtp": "xxxxxxxx", // Senha SMTP para autenticação
    "dataini": "2023-02-01", // Data de início da consulta (AAAA-MM-DD)
    "horaini": "00:01", // Hora de início da consulta (HH:MM)
    "datafim": "2023-08-30", // Data de fim da consulta (AAAA-MM-DD)
    "horafim": "23:59" // Hora de fim da consulta (HH:MM)
});

// Configuração da requisição HTTP
const options = {
    hostname: 'api.mailgrid.net.br', // Nome do servidor (domínio) para onde vamos enviar a requisição
    path: '/consolidate/', // Caminho (endpoint) específico da API
    method: 'POST', // Método HTTP a ser utilizado (POST)
    headers: {
        'Content-Type': 'application/json', // Tipo de conteúdo que estamos enviando, que é JSON
        'Content-Length': data.length // Comprimento do conteúdo (tamanho dos dados em bytes)
    }
};

// Realizando a requisição HTTP
const req = https.request(options, (res) => {
    // Variável para armazenar os dados da resposta
    let responseData = '';

    // A cada pedaço de dados recebido, adicionamos ao responseData
    res.on('data', (chunk) => {
        responseData += chunk;
    });

    // Quando a resposta for completamente recebida
    res.on('end', () => {
        try {
            // Tentamos converter a resposta da API para um objeto JSON
            const parsedResponse = JSON.parse(responseData);

            // Verifica se o código de status HTTP foi 200 (OK)
            if (res.statusCode === 200) {
                // Exibe a resposta formatada em JSON (bem indentado)
                console.log("Resposta da API:");
                console.log(JSON.stringify(parsedResponse, null, 2)); // JSON.stringify com indentação de 2 espaços
            } else {
                // Exibe mensagem de erro caso o código de status não seja 200
                console.log(`Erro na requisição. Código de status HTTP: ${res.statusCode}`);
            }
        } catch (error) {
            // Caso haja erro ao processar a resposta (por exemplo, se não for um JSON válido)
            console.log("Erro ao processar a resposta JSON:", error.message);
        }
    });
});

// Em caso de erro na requisição (como problemas de rede ou no servidor)
req.on('error', (error) => {
    console.error("Erro na requisição:", error.message);
});

// Envia os dados no corpo da requisição POST
req.write(data);

// Finaliza a requisição
req.end();
