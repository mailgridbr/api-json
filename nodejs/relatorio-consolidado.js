const axios = require('axios');

// Definição do endpoint da API
const url = "https://api.mailgrid.net.br/consolidate/";

// Dados de autenticação e parâmetros de consulta
const data = {
    "usuario_smtp": "smtp1@seudominio.com.br", // Usuário SMTP para autenticação
    "senha_smtp": "xxxxxxxx", // Senha SMTP para autenticação
    "dataini": "2023-02-01", // Data de início da consulta (AAAA-MM-DD)
    "horaini": "00:01", // Hora de início da consulta (HH:MM)
    "datafim": "2023-08-30", // Data de fim da consulta (AAAA-MM-DD)
    "horafim": "23:59" // Hora de fim da consulta (HH:MM)
};

// Configuração da requisição
const config = {
    headers: {
        'Content-Type': 'application/json' // Define o cabeçalho da requisição como JSON
    }
};

// Envia a requisição POST
axios.post(url, data, config)
    .then((response) => {
        // Se a resposta for bem-sucedida, exibe a resposta formatada
        console.log("Resposta da API:");
        console.log(JSON.stringify(response.data, null, 2)); // Exibe a resposta formatada
    })
    .catch((error) => {
        // Caso ocorra erro na requisição
        if (error.response) {
            // A requisição foi feita e o servidor respondeu com um status de erro
            console.log("Erro na requisição. Código de status HTTP: " + error.response.status);
            console.log("Resposta do servidor:", error.response.data);
        } else if (error.request) {
            // A requisição foi feita, mas não houve resposta
            console.log("Erro na requisição. Sem resposta do servidor:", error.request);
        } else {
            // Erro ao configurar a requisição
            console.log("Erro ao configurar a requisição:", error.message);
        }
    });
