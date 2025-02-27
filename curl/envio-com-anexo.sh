# Enviar um e-mail com anexos usando a API MailGrid com cURL

curl --location 'https://api.mailgrid.net.br/send/' \  # Endpoint da API para envio de e-mails
  --header 'Content-Type: application/json' \  # Define o cabeçalho para indicar que o corpo da requisição é em JSON
  --data-raw '{
    "host_smtp": "HOST-SMTP",  # Substitua pelo host SMTP do serviço de e-mail
    "usuario_smtp": "USUARIO-SMTP",  # Substitua pelo seu usuário SMTP para autenticação
    "senha_smtp": "SENHA-SMTP",  # Substitua pela senha SMTP para autenticação
    "emailRemetente": "EMAIL-REMETENTE",  # Substitua pelo e-mail do remetente
    "nomeRemetente": "NOME-REMETENTE",  # Substitua pelo nome do remetente
    "emailDestino": ["dev@mailgrid.com.br", "postmaster@mailgrid.com.br"],  # Lista de destinatários
    "assunto": "Teste da API JSON com anexo",  # Assunto do e-mail
    "mensagemAnexos": {  # Início da definição dos anexos
        "file1": {
            "name": "pixel.jpg",  # Nome do arquivo no e-mail
            "type": "image/jpeg",  # Tipo MIME do arquivo (neste caso, imagem JPEG)
            "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAb/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAf/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCNVJaAAAAAAAAH/9k="
        }, 
        "file2": {
            "name": "pixel2.jpg",  # Nome do segundo arquivo no e-mail
            "type": "image/jpeg",  # Tipo MIME do segundo arquivo (imagem JPEG)
            "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAP/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z"
        }
    },
    "mensagem": "<h1>Mensagem de teste da API com anexos</h1> <p>Testando anexos de <b>html</b> no envio da api</p>",  # Corpo da mensagem em HTML
    "mensagemTipo": "html",  # Define que o tipo da mensagem é HTML
    "mensagemEncoding": "quoted-printable",  # Codificação da mensagem para garantir a integridade dos caracteres especiais
    "mensagemAlt": "mensagem de teste da API JSON com anexos"  # Texto alternativo caso o HTML não seja renderizado corretamente
}'
