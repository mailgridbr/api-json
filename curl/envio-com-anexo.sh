# Enviar um e-mail com anexos usando a API mailgrid com cURL

curl --location 'https://api.mailgrid.net.br/sendmail/' \  # Endpoint da API para envio de e-mails
	--header 'Content-Type: application/json' \ # Define o cabeçalho para indicar que o corpo da requisição é em JSON
	--data-raw '{
	"host_smtp": "HOST-SMTP",  # Substitua pelo host SMTP do serviço de e-mail
	"usuario_smtp": "USUARIO-SMTP",  # Substitua pelo seu usuário SMTP para autenticação
	"senha_smtp": "SENHA-SMTP",  # Substitua pela senha SMTP para autenticação
	"emailRemetente": "EMAIL-REMETENTE",  # Substitua pelo e-mail do remetente
	"nomeRemetente": "NOME-REMETENTE",  # Substitua pelo nome do remetente
	"emailDestino": ["dev@mailgrid.net.br", "postmaster@mailgrid.net.br"],  # Lista de destinatários
	"assunto": "Teste da API JSON com anexo",  # Assunto do e-mail
	"mensagemAnexos": [
		{
			"name": "pixel.jpg",  # Nome do arquivo no e-mail
			"type": "image/jpeg",  # Tipo MIME do arquivo (neste caso, imagem JPEG)
			"content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDA...."
		}, 
		{
			"name": "pixel2.jpg",  # Nome do segundo arquivo no e-mail
			"type": "image/jpeg",  # Tipo MIME do segundo arquivo (imagem JPEG)
			"content": "/9j/4AAQSkZJRgABAQEBLAEsAAD/2wBDAAYEBAQFBAYFBQYJBgUGCQsIBgYICwwKCgsKCgwQDA...."
		}
	],
	"mensagem": "Mensagem de teste da API com anexos. Testando anexos de html no envio da api", 
	# Corpo da mensagem em HTML
	"mensagemTipo": "html",  # Define que o tipo da mensagem é HTML
	# Codificação da mensagem para garantir a integridade dos caracteres especiais
	"mensagemEncoding": "quoted-printable",
	# Texto alternativo caso o HTML não seja renderizado corretamente
	"mensagemAlt": "mensagem de teste da API JSON com anexos"
}'
