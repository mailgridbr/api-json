// Importa a biblioteca axios para fazer requisições HTTP
const axios = require('axios');

// Define a URL da API
const apiUrl = 'https://api.mailgrid.net.br/report/';

// Define os cabeçalhos da requisição
const headers = {
	// Corrigimos aqui usando apenas o Content-Type correto
	'Content-Type': 'application/json'
};

// Define o corpo da requisição como um objeto JavaScript
const data = {
	token_auth: 'INFORME-O-TOKEN-AQUI,    // Token de autenticação
	dataini: '2022-09-27',          // Data inicial do relatório
	horaini: '00:01',               // Hora inicial do relatório
	datafim: '2022-09-27',          // Data final do relatório
	horafim: '23:59'                // Hora final do relatório
};

// Faz a requisição POST usando axios
axios.post(apiUrl, data, {
	headers: headers,           // Passa os cabeçalhos
	// Equivalente a CURLOPT_SSL_VERIFYHOST e CURLOPT_SSL_VERIFYPEER como false
	// Usado apenas para debug, não recomendado em produção
	httpsAgent: new (require('https').Agent)({
	rejectUnauthorized: false
	})
})
	.then(response => {
	// Exibe a resposta da API (equivalente ao var_dump do PHP)
	console.log(response.data);
	})
	.catch(error => {
	// Trata possíveis erros na requisição
	console.error('Erro na requisição:', error.message);
	});
