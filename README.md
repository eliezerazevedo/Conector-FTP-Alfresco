# Conector FTP para Alfresco! :D

[![Github Badge](https://img.shields.io/badge/-Github-000?style=flat-square&logo=Github&logoColor=white&link=https://github.com/eliezerazevedo)](https://github.com/eliezerazevedo)
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/eliezerazevedo/)](https://www.linkedin.com/in/eliezerazevedo/)

### Português 
Este script é escrito em PowerShell e é usado para fazer upload de arquivos de uma pasta local para uma pasta remota em um servidor FTP. O script começa importando o módulo FTP, que fornece as funções necessárias para se conectar e interagir com um servidor FTP.
Em seguida, as variáveis de conexão FTP são definidas, incluindo o endereço do servidor FTP, o nome de usuário e a senha para acessar o servidor.
Em seguida, é definida a pasta local e remota.
O script então se conecta ao servidor FTP usando o endereço do servidor, nome de usuário e senha fornecidos nas variáveis.
Em seguida, usa-se o comando foreach para percorrer todos os arquivos na pasta local, fazendo upload de cada arquivo para a pasta remota no servidor FTP.
A cada arquivo enviado, é feito uma chamada para a função Remove-Item para deletar o arquivo da pasta local.
Por fim, o script desconecta-se do servidor FTP usando o comando $ftp.Abort().
Esse script é útil para automatizar o processo de upload de arquivos para um servidor FTP, especialmente se precisar ser feito com frequência ou em grandes volumes de arquivos.

Defina as variáveis de conexão FTP no arquivo script.ps1
```powershell
$ftpServer = "ftp://172.16.0.194"
$ftpUsername = "USUARIO FTP"
$ftpPassword = "SENHA DO FTP"
```

Defina a pasta local e remota no arquivo script.ps1
```powershell
$localFolder = ".\drop"
$remoteFolder = "/Alfresco/Sites/financeiro/documentLibrary/"
```

Execute o arquvivo de deploy
```powershell
deploy.bat
```

- [Website](https://printmaster.net.br/) 💻 - Working on it.
