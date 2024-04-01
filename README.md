# API MailGrid - JSON

## ENVIO DE EMAILS

Bem-vindo ao guia de referências da API de envio SMTP! É através desta API
que você irá integrar seu sistema ao nosso para realizar os envios através de
nosso SMTP dedicado.

___

ENDPOINT PARA ENVIO

A primeira coisa que você deve saber é o endpoint que usamos:
> https://painel.mailgrid.com.br/api/send/

- Também é possível usar o protocolo http caso prefira.
- As chamadas da API devem ser feitas em POST

___

INFORMAÇÕES ADICIONAIS

- Todos os envios são realizados na API pela porta 587 SMTP.
- Os parâmetros e conteúdos passados, devem ser codificados em UTF-8.

___

PARÂMETROS A SEREM PASSADOS

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `host_smtp` | `string` | **Obrigatório**. Endereço do servidor SMTP |
| `usuario_smtp` | `string` | **Obrigatório**. Usuário para autenticação |
| `senha_smtp` | `string` | **Obrigatório**. Senha para autenticação |
| `emailRemetente` | `string` | **Obrigatório**. Email do remetente |
| `nomeRemetente` | `string` | **Opcional**. Nome do remetente |
| `emailReply` | `string` | **Opcional**. Email de resposta |
| `emailDestino` | `string[]` | **Obrigatório**. Array com emails para onde será enviada a mensagem - max 100 contatos por chamada |
| `nomeDestino` | `string[]` | **Opcional**. Nome do destinatário |
| `emailDestinoCopia` | `string[]` | **Opcional**. Array com email para onde será copiada a mensagem - max 100 contatos por chamada |
| `emailDestinoCopiaOculta` | `string[]` | **Opcional**. Array com email para onde será copiada a mensagem de forma oculta - max 100 contatos por chamada |
| `assunto` | `string[]` | **Obrigatório**. Assunto da mensagem |
| `mensagem` | `string[]` | **Obrigatório, aceita texto ou HTML**. Mensagem a ser enviada |
| `mensagemAlt` | `string[]` | **Opcional**. Mensagem alternativa/AltBody, texto puro |
| `mensagemTipo` | `string[]` | **Opcional**. Tipo da mensagem, se texto ou HTML. Caso não seja definido, o tipo padrão será HTML |
| `mensagemEncoding` | `string[]` | **Opcional**. Codificação da mensagem, base64 ou quoted-printable. Caso não seja definido, a codificação padrão será base64 |
| `mensagemAnexos` | `string[]` | **Opcional**. Array com anexos codificados em base64 |


# NO CASO DE ENVIAR UM OU MAIS ANEXOS

A API permite o envio de um ou mais arquivos anexos, usando o parâmetro opcional, mensagemAnexos para isso, em array, no seguinte modelo: 

onde: 

name - deve ser informado o nome do arquivo (ex:  imagem.jpg)
type  - tipo Mime do arquivo a ser anexado (ex: image/jpeg)
content - arquivo codificado em base64 / Data URI

exemplo: 
```json
{
  "file1":
    {
      "name": "imagem.jpg",
      "type": "image/jpeg",
      "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAb/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAf/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCNVJaAAAAAAAAH/9k="
    },
  "file2":
    {
      "name": "pixel2.jpg",
      "type": "image/jpeg",
      "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAP/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z"
    }
},
```

___

Atenção: Os dados devem ser passados via __POST__, codificados em __JSON__.
Não esqueça de passar o header __Content-Type: application/json__

O tamanho total da mensagem (incluindo anexos) não deve exceder 50 MB. Isso inclui a mensagem em si, os cabeçalhos e o tamanho combinado de quaisquer anexos.

___

CÓDIGOS DE RETORNO

- `200` MSG ENVIADA - Informa que o envio ocorreu com sucesso
  
- `208` FALTAM PARAMETROS - Informa que um ou mais parâmetros obrigatórios, não foi passado ou não foram passados no formato JSON

- `204` ERRO DE ENVIO - Ocorre quando houve erro no envio, ocasionado por falha de conexão SMTP

- `207` ERRO: FALHA DE AUTENTICACAO  - Ocorre quando forem passados dados incorretos de autenticação SMTP

- `211` ERRO: ENCODING INVALIDO - Ocorre quando for passado o parâmetro demensagemEncoding de forma incorreta ou formato inválido

- `212` ERRO: TIPO INVALIDO - Ocorre quando for passado o parâmetro mensagemTipo de forma incorreta ou formato inválido

- `215` ERRO: TAMANHO EXCEDIDO - Ocorre quando o tamanho total da mensagem, incluindo anexos, exceder o limite do plano

___

EXEMPLOS DE CHAMADA E RETORNO

Exemplo de chamada para envio:

```json
{
    "host_smtp": "gridxxxxxxxx.mailgrid.com.br",
    "usuario_smtp": "apitestexxxxxx@mailgrid.com.br", 
    "senha_smtp": "xxxxxxxxxxxxxxxx", 
    "emailRemetente": "teste@mailgrid.com.br", 
    "nomeRemetente": "MailGrid",
    "emailDestino": ["teste@mailgrid.com.br","postmaster@mailgrid.com.br"], 
    "assunto": "Teste da API json produção",
    "mensagemAnexos": {"file1": {"name": "pixel.jpg", "type": "image/jpeg", "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAb/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAf/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCNVJaAAAAAAAAH/9k="}, "file2": {"name": "pixel2.jpg", "type": "image/jpeg", "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAP/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z"}},
    "mensagem": "Mensagem de teste da API - Testando api de <b>html</b> de envio json",
    "mensagemTipo": "html",
    "mensagemEncoding": "base64",
    "mensagemAlt": "mensagem de teste da API json"
    }
```
Exemplo de retorno em JSON:

Quando a mensagem for enviada com sucesso:

```json
{
  "0": {
    "status": "MSG ENVIADA",
    "codigo": "200",
    "id": "1rDPyZ-0006kJ-2N",
    "criptokey": "67bb60dc8c61c2c807c53a97c781176a",
    "to": "postmaster@mailgrid.com.br"
  }
}
```

Quando ocorrer erro no envio, retornará o erro:

```json
{
  "status": "ERRO DE ENVIO",
  "codigo": "204",
  "criptokey": "f87e7bf77c609d9537e146fb32d88418",
  "to": "seunome@seuemail.com"
}
```
___

Caso a API retorne o erro “FALTAM PARAMETROS”, ex:
```json
{
  "status":"ERRO: FALTAM PARAMETROS",
  "codigo":"208"
}
```

Isso quer dizer que um ou mais parâmetros não foram passados corretamente via POST e codificados em JSON.

___

As mensagens enviadas com sucesso são registradas automaticamente no relatório de envios, onde o painel tem atualização aprox. a cada 10 minutos.

___

## RELATÓRIO DE EMAILS

É através desta API que você irá integrar seu sistema ao nosso para obter relatórios dos envios realizados através de nosso SMTP dedicado.

___

ENDPOINT PARA OBTER RELATÓRIO DE ENVIOS 

Use para obter relatório dos envios realizados

A primeira coisa que você deve saber é o endpoint que usamos:

> https://painel.mailgrid.com.br/api/report/

- Também é possível usar o protocolo http caso prefira.
- As chamadas da API devem ser feitas em POST, codificados em JSON


___

PARÂMETROS
| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `usuario_smtp` | `string` | **Obrigatório**. usuário para autenticação – fornecido na abertura de conta, o mesmo utilizado para autenticação smtp |
| `senha_smtp` | `string` | **Obrigatório**. senha para autenticação – a mesma senha utilizada na autenticação smtp |
| `dataini` | `string` | **Obrigatório**. Data de início da consulta – formato aaaa-mm-dd |
| `horaini` | `string` | **Obrigatório**. Hora de início da consulta – formato HH:MM |
| `datafim` | `string` | **Obrigatório**. Data de fim da consulta – formato aaaa-mm-dd |
| `horafim` | `string` | **Obrigatório**. Hora de fim da consulta – formato HH:MM |
| `status` | `string` | **Opcional**. status dos envios a serem consultados, erro ou sucesso - ex: se passar status=sucesso o relatório somente retornará os emails entregues |
| `emaildestino` | `string` | **Opcional**. email para onde a mensagem foi enviada - caso queira pesquisar emails enviados para um determinado destinatário |
| `remetente` | `string` | **Opcional**. email utilizado como remetente do envio - caso queira pesquisar emails enviados por um determinado remetente |
| `idMensagem` | `string` | **Opcional**. caso queira consultar/pesquisar apenas pelo id de uma mensagem enviada |

___

Atenção: Os dados devem ser passados via __POST__, codificados em __JSON__.
Não esqueça de passar o header __Content-Type: application/json__

___

Exemplo de chamada em JSON:

Substitua os valores conforme os dados da sua conta e período desejado para consulta.

```json
{
"usuario_smtp": "smtp1@seudominio.com.br",
"senha_smtp": "xxxxxxxx",
"dataini": "2023-02-01",
"horaini": "00:01",
"datafim": "2023-08-30",
"horafim": "00:01"
}
```

___

Exemplo de retorno da API:

Quando os parâmetros forem passados corretamente, a API retornará os dados dos envios, no período selecionado.
Ex:

```json
{
  "0": {
    "msgid": "1htNLA-0007eW-SP",
    "email_de": "nfe@seudominio.com.br",
    "email_para": "joao@gmail.com",
    "data": "01/08/2023",
    "hora": "23:30:47",
    "status": "Entregue com sucesso"
  },
  "1": {
    "msgid": "1htKEX-0003Ef-0G",
    "email_de": "nfe@seudominio.com.br",
    "email_para": "roberto@hotmail.com",
    "data": "01/08/2023",
    "hora": "20:11:43",
    "status": "Entregue com sucesso"
  }
}
```

___

CÓDIGOS DE RETORNO 

- `207` ERRO: FALHA DE AUTENTICACAO - Dados de autenticação informados incorretamente (usuario e senha da conta principal)

- `208` ERRO: FALTAM PARAMETROS - Informa que um ou mais parâmetros obrigatórios, não foi passado ou não foram passados no formato JSON

- `210` ERRO: DATA COM FORMATO INCORRETO - Data para pesquisa, informada incorretamente - use somente formato YYYY-MM-DD

- `211` ERRO: HORA COM FORMATO INCORRETO - Hora para pesquisa, informada incorretamente - use somente formato HH:MM

Atenção! Os relatórios de envios são atualizados aprox. a cada 10 minutos. Ao realizar um envio, caso não o veja em seguida no painel, basta aguardar a
atualização.

___


## RELATÓRIO CONSOLIDADO

É através desta API que você irá integrar seu sistema ao nosso para obter o relatório consolidado dos envios realizados através de SMTP.

___

ENDPOINT PARA OBTER RELATÓRIO DE ENVIOS 

Use para obter relatório dos envios realizados

A primeira coisa que você deve saber é o endpoint que usamos:

> https://painel.mailgrid.com.br/api/consolidate/

- Também é possível usar o protocolo http caso prefira.
- As chamadas da API devem ser feitas em POST, codificados em JSON


___

PARÂMETROS

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `usuario_smtp` | `string` | **Obrigatório**. usuário para autenticação – fornecido na abertura de conta, o mesmo utilizado para autenticação smtp |
| `senha_smtp` | `string` | **Obrigatório**. senha para autenticação – a mesma senha utilizada na autenticação smtp |
| `dataini` | `string` | **Obrigatório**. Data de início da consulta – formato aaaa-mm-dd |
| `horaini` | `string` | **Obrigatório**. Hora de início da consulta – formato HH:MM |
| `datafim` | `string` | **Obrigatório**. Data de fim da consulta – formato aaaa-mm-dd |
| `horafim` | `string` | **Obrigatório**. Hora de fim da consulta – formato HH:MM |
| `status` | `string` | **Opcional**. status dos envios a serem consultados, erro ou sucesso - ex: se passar status=sucesso o relatório somente retornará os emails entregues |
| `emaildestino` | `string` | **Opcional**. email para onde a mensagem foi enviada - caso queira pesquisar emails enviados para um determinado destinatário |
| `remetente` | `string` | **Opcional**. email utilizado como remetente do envio - caso queira pesquisar emails enviados por um determinado remetente |

___

Atenção: Os dados devem ser passados via POST, codificados em JSON.
Não esqueça de passar o header Content-Type: application/json

___

Exemplo de chamada em JSON:

Substitua os valores conforme os dados da sua conta e período desejado para consulta.

```json
{
"usuario_smtp": "smtp1@seudominio.com.br",
"senha_smtp": "xxxxxxxx",
"dataini": "2023-02-01",
"horaini": "00:01",
"datafim": "2023-08-30",
"horafim: "23:59"
}
```

___

Exemplo de retorno da API:

Quando os parâmetros forem passados corretamente, a API retornará os dados dos envios, no período selecionado.
Ex:

```json
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
```

___

CÓDIGOS DE RETORNO 

- `207` ERRO: FALHA DE AUTENTICACAO - Dados de autenticação informados incorretamente (usuario e senha da conta principal)

- `208` ERRO: FALTAM PARAMETROS - Informa que um ou mais parâmetros obrigatórios, não foi passado ou não foram passados no formato JSON

- `210` ERRO: DATA COM FORMATO INCORRETO - Data para pesquisa, informada incorretamente - use somente formato YYYY-MM-DD

- `211` ERRO: HORA COM FORMATO INCORRETO - Hora para pesquisa, informada incorretamente - use somente formato HH:MM

Atenção! Os relatórios de envios são atualizados aprox. a cada 10 minutos. Ao realizar um envio, caso não o veja em seguida no painel, basta aguardar a
atualização.

Atenção! Os relatórios de envios são atualizados aprox. a cada 10 minutos. Ao realizar um envio, caso não o veja em seguida no painel, basta aguardar a
atualização.

___

Em caso de dúvidas, entre em contato com nosso suporte técnico, pela URL

> https://www.mailgrid.com.br/suporte

Link para acesso no site:

> https://www.mailgrid.com.br/api

