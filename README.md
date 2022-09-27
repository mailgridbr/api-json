# api-json

===============================================================
API envio com API JSON
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

-----

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

-----

Atenção: Os dados devem ser passados via POST, codificados em JSON.
Não esqueça de passar o header Content-Type: application/json

-----

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

-----

Caso a API retorne o erro “FALTAM PARAMETROS”, ex:

{"status":"ERRO: FALTAM PARAMETROS","codigo":"208"}

Isso quer dizer que um ou mais parâmetros não foram passados corretamente via POST e codificados em JSON.

-----

As mensagens enviadas com sucesso são registradas automaticamente no relatório de envios, com atualização aprox. a cada 15 minutos.



===============================================================
API DE RELATÓRIOS JSON
===============================================================

API para obter relatório de envios - JSON

Bem-vindo ao guia de referências da API de relatórios! É através desta API que você irá integrar seu sistema ao nosso para obter o
relatório de entrega dos envios realizados através de nosso SMTP dedicado.

A primeira coisa que você deve saber é o endpoint que usamos:
https://painel.mailgrid.com.br/api/report.php

OBS: Também é possível usar o protocolo http caso prefira.

Os parâmetros devem ser passados em POST, codificados em JSON.

----

Parâmetros a serem enviados

[ Parametro ] - Obs.

usuario_smtp (usuário para autenticação – fornecido na abertura de conta, o mesmo utilizado para autenticação smtp) - Obrigatório

senha_smtp (senha para autenticação – a mesma senha utilizada na autenticação smtp) - Obrigatório

dataini (Data de início da consulta – formato aaaa-mm-dd) - Obrigatório

horaini (Hora de início da consulta – formato HH:MM) - Obrigatório

datafim (Data de fim da consulta – formato aaaa-mm-dd) - Obrigatório

horafim (Hora de fim da consulta – formato HH:MM) - Obrigatório

status (status dos envios a serem consultados, erro ou sucesso - ex: se passar status=sucesso o relatório somente retornará os emails entregues) - Opcional

emaildestino (email para onde a mensagem foi enviada - caso queira pesquisar emails enviados para um determinado destinatário) - Opcional

remetente (email utilizado como remetente do envio - caso queira pesquisar emails enviados por um determinado remetente) - Opcional

----

Exemplo de chamada em JSON:

Substitua os valores conforme os dados da sua conta e período desejado para consulta.
{
"usuario_smtp": "smtp1@seudominio.com.br",
"senha_smtp": "xxxxxxxx",
"dataini": "2019-02-01",
"horaini": "00:01",
"datafim": "2019-08-30",
"horafim

----

Exemplo de retorno da API:

Quando os parâmetros forem passados corretamente, a API retornará os dados dos envios, no período selecionado.
Ex:
{
"0": {
"msgid": "1htNLA-0007eW-SP",
"email_de": "nfe@seudominio.com.br",
"email_para": "joao@gmail.com",
"data": "01/08/2019",
"hora": "23:30:47",
"status": "Entregue com sucesso"
},
"1": {
"msgid": "1htKEX-0003Ef-0G",
"email_de": "nfe@seudominio.com.br",
"email_para": "roberto@hotmail.com",
"data": "01/08/2019",
"hora": "20:11:43",
"status": "Entregue com sucesso"
}
}


----

Quando ocorrer erro na informação dos parâmetros, resultará em mensagem de erro:

ex: {"0":{"status":"ERRO: FALTAM PARAMETROS","codigo":"208"}}

----

Códigos e erros:

{"0":{"status":"ERRO: FALTAM PARAMETROS","codigo":"208"}}
Isso quer dizer que um ou mais parâmetros obrigatórios, não foram passados.

{"0":{"status":"ERRO: FALHA DE AUTENTICACAO","codigo":"207"}}
Informa que os dados fornecidos estão incorretos (usuário e senha)

{"0":{"status":"ERRO - DATA COM FORMATO INCORRETO - formato deve ser YYYY-MM-DD","codigo":"210"}}
Data fornecida em formato incorreto. Informe a data no formato ANO-MES-DIA (ex: 2018-12-01)

{"0":{"status":"ERRO - HORA COM FORMATO INCORRETO - formato deve ser HH:MM","codigo":"211"}}
Hora fornecida com formato incorreto. Informe a hora no formato solicitado:
HH:MM (horas:minutos) ex: 12:02

Atenção! Os relatórios de envios são atualizados aprox. a cada 15 minutos. Ao realizar um envio, caso não o veja em seguida no painel, basta aguardar a
atualização.

----

===============================================================

Em caso de dúvidas, entre em contato com nosso suporte técnico, pela URL https://www.mailgrid.com.br/suporte

Link para acesso no site:  https://www.mailgrid.com.br/api

