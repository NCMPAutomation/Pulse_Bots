
$username2 = ''
$password2 = ''
$pass2= ConvertTo-SecureString $password2 -AsPlainText -Force
$azure_cred2 = New-Object System.Management.Automation.PsCredential( $username2, $pass2 )

#file system########################
$setsession = New-SSHSession -ComputerName $IP -Credential $azure_cred2
$setsession_Id = $setsession_Id.id
$Results_file_system = Invoke-SSHCommand -SessionId $setsession_Id -Command "show file systems" 
$Results_file_system 
Remove-SSHSession -SessionId $setsession_Id