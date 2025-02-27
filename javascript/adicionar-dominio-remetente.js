const https = require('https');

// Definição do endpoint da API
const url = "https://api.mailgrid.net.br/domain/add/";

// Dados de autenticação e domínio a ser adicionado
const data = JSON.stringify({
    "token_auth": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", // Token de autenticação obtido no painel do cliente
    "dominio": "dominioaseradicionado.net.br" // Domínio a ser adicionado para envios
});

// Configuração da requisição
const options = {
    hostname: 'api.mailgrid.net.br',
    path: '/domain/add/',
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Content-Length': data.length
    }
};

// Realizando a requisição HTTP
const req = https.request(options, (res) => {
    let responseData = '';

    // Quando os dados forem recebidos
    res.on('data', (chunk) => {
        responseData += chunk;
    });

    // Quando a resposta estiver completa
    res.on('end', () => {
        try {
            // Converte a resposta para JSON e exibe
            const parsedResponse = JSON.parse(responseData);
            console.log("Resposta da API:");
            console.log(JSON.stringify(parsedResponse, null, 2));
        } catch (error) {
            console.log("Erro ao processar a resposta JSON:", error.message);
        }
    });
});

// Em caso de erro na requisição
req.on('error', (error) => {
    console.error("Erro na requisição:", error.message);
});

// Envia os dados no corpo da requisição
req.write(data);

// Finaliza a requisição
req.end();
