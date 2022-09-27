# api-json
Exemplos de envio com API JSON

===============================================================

API para envio de email - JSON

Bem-vindo ao guia de referências da API de envio SMTP! É através desta API
que você irá integrar seu sistema ao nosso para realizar os envios através de
nosso SMTP dedicado.

A primeira coisa que você deve saber é o endpoint que usamos:
https://painel.mailgrid.com.br/api/

OBS: Também é possível usar o protocolo http caso prefira.

As chamadas da API devem ser feitas em POST

Objeto status

Ao realizar um envio, este será o objeto que você irá receber como resposta.
Todos os envios são realizados na API pela porta 587 SMTP.

OBS: Parâmetros devem ser codificados em UTF-8.

===============================================================

*** Parâmetros a serem enviados ***

[ Parâmetro ] - Obs.

host_smtp (Endereço do servidor SMTP) -  Obrigatório

usuario_smtp (Usuário para autenticação) -  Obrigatório

senha_smtp (Senha para autenticação) -  Obrigatório

emailRemetente (Email do remetente) - Obrigatório

nomeRemetente (Nome do remetente) -  Opcional

emailReply (Email de resposta) - Opcional

emailDestino (Array com emails para onde será enviada a mensagem) - Obrigatório

nomeDestino (Nome do destinatário) -  Opcional

emailDestinoCopia (Array com email para onde será copiada a mensagem) - Opcional

assunto (Assunto da mensagem) - Obrigatório

mensagem Mensagem a ser enviada Obrigatório – texto ou html


** se for enviar anexo **

anexoContent (arquivo codificado em base64 / Data URI) - Opcional

anexoFileName (nome do arquivo a ser enviado) - Opcional

anexoType (tipo Mime do arquivo a ser anexado. ex: image/jpeg) - Opcional

===============================================================

Atenção: Os dados devem ser passados via POST, codificados em JSON.
Não esqueça de passar o header Content-Type: application/json

===============================================================

Exemplo de retorno em JSON:

Quando a mensagem for enviada com sucesso:

{
  "0": {
    "status": "MSG ENVIADA",
    "codigo": "200",
    "criptokey": "67bb60dc8c61c2c807c53a97c781176a",
    "to": "postmaster@mailgrid.com.br"
  }
}

Quando ocorrer erro no envio, retornará o erro:

{
  "status": "ERRO",
  "codigo": "204",
  "criptokey": "f87e7bf77c609d9537e146fb32d88418",
  "to": "seunome@seuemail.com"
}

===============================================================

Caso a API retorne o erro “FALTAM PARAMETROS”, ex:

{"status":"ERRO: FALTAM PARAMETROS","codigo":"208"}

Isso quer dizer que um ou mais parâmetros não foram passados corretamente via POST e codificados em JSON.


===============================================================

As mensagens enviadas com sucesso são registradas automaticamente no relatório de envios, com atualização aprox. a cada 15 minutos.

Em caso de dúvidas, entre em contato com nosso suporte técnico, pela URL https://www.mailgrid.com.br/suporte

Link para acesso no site:  https://www.mailgrid.com.br/api
