# Importar o módulo FTP
Import-Module FTP

# Defina as variáveis de conexão FTP
$ftpServer = "ftp://172.16.0.194"
$ftpUsername = "USUARIO FTP"
$ftpPassword = "SENHA DO FTP"

# Defina a pasta local e remota
$localFolder = ".\ScanDrop"
$remoteFolder = "/Alfresco/Sites/financeiro/documentLibrary/"

# Conecte-se ao servidor FTP
$ftp = [System.Net.FtpWebRequest]::Create($ftpServer)
$ftp.Credentials = New-Object System.Net.NetworkCredential($ftpUsername,$ftpPassword)
$ftp.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectory
$ftp.GetResponse()

# Faça upload dos arquivos para a pasta remota
foreach($file in (Get-ChildItem $localFolder)) {
    $fileStream = New-Object IO.FileStream($file.FullName,[IO.FileMode]::Open)
    $ftp = [System.Net.FtpWebRequest]::Create($ftpServer + "/" + $remoteFolder + "/" + $file.Name)
    $ftp.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
    $ftp.Credentials = New-Object System.Net.NetworkCredential($ftpUsername,$ftpPassword)
    $ftp.ContentLength = $fileStream.Length
    $ftpStream = $ftp.GetRequestStream()
    $fileStream.CopyTo($ftpStream)
    $ftpStream.Close()
    $fileStream.Close()
    #Deletar arquivos da pasta local apos upload
    Remove-Item $file.FullName
}

# Desconecte-se do servidor FTP
$ftp.Abort()
