// Importa a biblioteca axios para fazer requisições HTTP
const axios = require('axios');

// Define a URL da API
const apiUrl = 'https://api.mailgrid.net.br/sendmail/';

// Define os cabeçalhos da requisição
const headers = {
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
    'destinatario1@dominio.com.br',
    'destinatario2@dominio.com.br'
  ],
  
  // Assunto do email
  assunto: 'Teste de envio com anexo via API JSON',
  
  // Anexos da mensagem (objeto com arquivo codificado em base64)
  mensagemAnexos: [
    {
      name: 'anexoexemplo.pdf',           // Nome do arquivo
      type: 'application/pdf',           // Tipo MIME do arquivo
      content: 'UEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/...//Z'  // Conteúdo em base64
    }
  ],
  
  // Conteúdo principal do email em HTML
  mensagem: 'Mensagem de teste da API com anexo. O arquivo codificado acima não funciona, é apenas um exemplo.',
  
  // Tipo e codificação da mensagem
  mensagemTipo: 'html',          // Define o formato como HTML
  mensagemEncoding: 'base64',    // Define a codificação como base64
  
  // Versão alternativa em texto puro
  mensagemAlt: 'Mensagem de teste da API com anexo. O arquivo codificado acima não funciona, é apenas um exemplo.'
};

// Faz a requisição POST usando axios
axios.post(apiUrl, data, {
  headers: headers,           // Passa os cabeçalhos
  maxRedirects: 10,          // Equivalente a CURLOPT_MAXREDIRS
  timeout: 0,               // Sem timeout (equivalente a CURLOPT_TIMEOUT => 0)
  httpAgent: new (require('http').Agent)({ keepAlive: true }), // Mantém a conexão viva
})
  .then(response => {
    // Exibe a resposta da API
    console.log(response.data);
  })
  .catch(error =>  {
    // Trata possíveis erros na requisição
    console.error('Erro na requisição:', error.message);
});
