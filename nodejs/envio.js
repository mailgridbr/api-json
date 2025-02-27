// Importa a biblioteca axios para fazer requisições HTTP
const axios = require('axios');

// Define a URL da API
const apiUrl = 'https://api.mailgrid.net.br/send/';

// Define os cabeçalhos da requisição
const headers = {
  // No PHP, "Authorization: Content-Type: application/json" parece ser um erro
  // Corrigimos aqui usando apenas o Content-Type correto
  'Content-Type': 'application/json'
};

// Define o corpo da requisição como um objeto JavaScript
const data = {
  // Configurações do servidor SMTP
  host_smtp: 'HOST-SMTP',          // Endereço do servidor SMTP
  usuario_smtp: 'USUARIO-SMTP',    // Usuário para autenticação SMTP
  senha_smtp: 'SENHA-SMTP',        // Senha para autenticação SMTP
  
  // Informações do remetente
  emailRemetente: 'EMAIL-REMETENTE',  // Email do remetente
  nomeRemetente: 'NOME-REMETENTE',    // Nome do remetente
  
  // Lista de destinatários
  emailDestino: [
    'postmaster@mailgrid.com.br',
    'dev@mailgrid.com.br'
  ],
  
  // Assunto e conteúdo da mensagem
  assunto: 'Teste de envio via API JSON',      // Assunto do email
  mensagem: 'Mensagem de teste da API JSON'    // Corpo do email
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
