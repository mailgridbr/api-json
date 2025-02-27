// URL do endpoint da API para envio de e-mail
const url = 'https://api.mailgrid.net.br/send/';

// Definição dos dados que serão enviados na requisição (e-mail, anexos, etc)
const data = JSON.stringify({
    "host_smtp": "HOST-SMTP",                  // Host do servidor SMTP
    "usuario_smtp": "USUARIO-SMTP",            // Usuário SMTP
    "senha_smtp": "SENHA-SMTP",                // Senha SMTP
    "emailRemetente": "EMAIL-REMETENTE",       // E-mail do remetente
    "nomeRemetente": "NOME-REMETENTE",         // Nome do remetente
    "emailDestino": ["dev@mailgrid.com.br", "postmaster@mailgrid.com.br"], // Destinatários do e-mail
    "assunto": "Teste da API JSON com anexo",  // Assunto do e-mail
    "mensagemAnexos": {
        "file1": { 
            "name": "pixel.jpg", 
            "type": "image/jpeg", 
            "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD..." // Exemplo de conteúdo codificado em base64
        },
        "file2": {
            "name": "pixel2.jpg", 
            "type": "image/jpeg", 
            "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD..." // Outro exemplo de conteúdo codificado em base64
        }
    },
    "mensagem": "<h1>Mensagem de teste da API com anexos</h1> <p>Testando anexos de <b>html</b> no envio da api</p>", // Corpo da mensagem em HTML
    "mensagemTipo": "html",                    // Tipo de conteúdo da mensagem (html ou texto)
    "mensagemEncoding": "quoted-printable",    // Codificação da mensagem
    "mensagemAlt": "mensagem de teste da API JSON com anexos" // Texto alternativo da mensagem
});

// Função assíncrona para enviar a requisição POST para a API
async function sendEmail() {
    try {
        // Envia a requisição usando o fetch API
        const response = await fetch(url, {
            method: 'POST',                        // Definindo o método HTTP como POST
            headers: {
                'Content-Type': 'application/json', // Definindo o tipo de conteúdo como JSON
            },
            body: data, // Envia os dados convertidos para JSON
        });

        // Verifica se a resposta foi bem-sucedida (código 2xx)
        if (!response.ok) {
            throw new Error(`Erro na requisição: ${response.status} - ${response.statusText}`);
        }

        // Lê a resposta da API como texto
        const text = await response.text();

        // Exibe a resposta no console (pode ser JSON ou erro da API)
        console.log("Resposta da API:", text);
    } catch (error) {
        // Trata qualquer erro que ocorra durante a requisição
        console.error("Erro ao enviar o e-mail:", error);
    }
}

// Chama a função para enviar o e-mail
sendEmail();
