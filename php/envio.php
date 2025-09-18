// Inicializa a sessão cURL
$curl = curl_init();

// Define as opções cURL usando um array associativo
curl_setopt_array($curl, array(
 // URL da API mailgrid para envio de email
 CURLOPT_URL =>'https://api.mailgrid.net.br/sendmail/',
	
 // Faz com que o cURL retorne a resposta como string
 CURLOPT_RETURNTRANSFER =>true,

 // Define a codificação de resposta para ser aceita
 CURLOPT_ENCODING =>'',

 // Define o número máximo de redirecionamentos
 CURLOPT_MAXREDIRS =>10,

 // Define o tempo máximo de espera da requisição
 CURLOPT_TIMEOUT =>0,

 // Permite o cURL seguir redirecionamentos automaticamente
 CURLOPT_FOLLOWLOCATION =>true,

 // Define a versão do protocolo HTTP a ser usado
 CURLOPT_HTTP_VERSION =>CURL_HTTP_VERSION_1_1,

 // Define o método da requisição como POST
 CURLOPT_CUSTOMREQUEST =>'POST',

 // Define os dados do corpo da requisição em formato JSON
 CURLOPT_POSTFIELDS => '{
    "host_smtp": "HOST-SMTP", // Substitua por seu host SMTP
    "usuario_smtp": "USUARIO-SMTP", // Substitua pelo usuário SMTP
    "senha_smtp": "SENHA-SMTP", // Substitua pela senha SMTP
    "emailRemetente": "EMAIL-REMETENTE", // Email do remetente
    "nomeRemetente": "NOME-REMETENTE", // Nome do remetente
    "emailDestino": ["destinatario1@dominio.com.br", "destinatario2@dominio.com.br"], // Emails dos destinatários
    "assunto": "Teste de envio com anexo via API JSON", // Assunto do email
    "mensagemAnexos": [
	    {
	       "name": "anexoexemplo.pdf", // Nome do arquivo
	       "type": "application/pdf", // Tipo MIME do arquivo
	        "content": "UEAEAAAAAAAAAAAAAAAAAAAAA/..." // Conteúdo do arquivo codificado em base64
	    }
    ],
    "mensagem": "Mensagem de teste da API com anexo. Atenção, o arquivo codificado acima não funciona, é um exemplo."
    "mensagemTipo": "html", // Tipo de mensagem (HTML)
    "mensagemEncoding": "base64", // Codificação do arquivo anexo (base64)
    "mensagemAlt": "Mensagem de teste da API com anexo. Atenção, o arquivo codificado acima não funciona, é um exemplo."
}',

	// Define o cabeçalho da requisição, informando que o corpo está em JSON
	CURLOPT_HTTPHEADER => array(
		'Content-Type: application/json'
	),
));

// Executa a requisição cURL e armazena a resposta
$response = curl_exec($curl);

// Fecha a sessão cURL
curl_close($curl);

// Exibe a resposta recebida da API
echo $response;
