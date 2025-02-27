// URL do endpoint da API para envio de e-mail
var url = "https://api.mailgrid.net.br/send/";

// Criação de um novo objeto XMLHttpRequest para realizar a requisição
var xhr = new XMLHttpRequest();

// Configuração do método da requisição (POST) e URL do endpoint
xhr.open("POST", url);

// Definição dos cabeçalhos para a requisição, incluindo tipo de conteúdo
xhr.setRequestHeader("Content-Type", "application/json"); // Define que os dados serão enviados como JSON
xhr.setRequestHeader("Authorization", "Bearer SEU_TOKEN_AQUI"); // Substitua pelo seu token de autenticação (se necessário)

// Função que será chamada sempre que o estado da requisição mudar
xhr.onreadystatechange = function () {
   // Verifica se a requisição foi concluída (readyState 4 significa "done")
   if (xhr.readyState === 4) {
      // Exibe o código de status da resposta (200 indica sucesso)
      console.log("Código de status:", xhr.status);
      
      // Exibe o conteúdo da resposta da API
      console.log("Resposta:", xhr.responseText);
      
      // Verifica se a requisição foi bem-sucedida (status 2xx)
      if (xhr.status >= 200 && xhr.status < 300) {
          console.log("E-mail enviado com sucesso!");
      } else {
          console.error("Erro ao enviar o e-mail.");
      }
   }
};

// Dados que serão enviados no corpo da requisição
var data = JSON.stringify({
    "host_smtp": "HOST-SMTP",                // Host do servidor SMTP
    "usuario_smtp": "USUARIO-SMTP",          // Usuário SMTP
    "senha_smtp": "SENHA-SMTP",              // Senha SMTP
    "emailRemetente": "EMAIL-REMETENTE",     // E-mail do remetente
    "nomeRemetente": "NOME-REMETENTE",       // Nome do remetente
    "emailDestino": ["postmaster@mailgrid.com.br", "dev@mailgrid.com.br"], // E-mails de destino
    "assunto": "Teste de envio via API JSON", // Assunto do e-mail
    "mensagem": "mensagem de teste da API JSON" // Corpo do e-mail
});

// Envia a requisição com os dados no formato JSON
xhr.send(data);

