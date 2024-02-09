curl --location 'https://painel.mailgrid.com.br/api/send/' \
--header 'Content-Type: application/json' \
--data-raw '{
    "host_smtp": "HOST-SMTP",
    "usuario_smtp": "USUARIO-SMTP", 
    "senha_smtp": "SENHA-SMTP", 
    "emailRemetente": "EMAIL-REMETENTE", 
    "nomeRemetente": "NOME-REMETENTE",
    "emailDestino": ["dev@mailgrid.com.br","postmaster@mailgrid.com.br"], 
    "assunto": "Teste da API JSON com anexo",
    "mensagemAnexos": {"file1": {"name": "pixel.jpg", "type": "image/jpeg", "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAb/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAf/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwCNVJaAAAAAAAAH/9k="}, "file2": {"name": "pixel2.jpg", "type": "image/jpeg", "content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDAwMDAwMEAwODxAPDgwTExQUExMcGxsbHCAgICAgICAgICD/2wBDAQcHBw0MDRgQEBgaFREVGiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICD/wAARCAAUABQDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAP/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAYH/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AoytOgAAAAAAAP//Z"}},
    "mensagem": "<h1>Mensagem de teste da API com anexos</h1> <p>Testando anexos de <b>html</b> no envio da api</p>",
    "mensagemTipo": "html",
    "mensagemEncoding": "quoted-printable",
    "mensagemAlt": "mensagem de teste da API JSON com anexos"
    }'
