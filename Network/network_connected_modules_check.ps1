
$username2 = ''
$password2 = ''
$pass2= ConvertTo-SecureString $password2 -AsPlainText -Force
$azure_cred2 = New-Object System.Management.Automation.PsCredential( $username2, $pass2 )

#connected modules##################################
$setsession = New-SSHSession -ComputerName $IP -Credential $azure_cred2
$setsession_Id = $setsession_Id.id
$setsession = New-SSHSession -ComputerName $IP -Credential $azure_cred2
$Results_modules = Invoke-SSHCommand -SessionId $setsession_Id -Command "show module" 
$Results_modules 
Remove-SSHSession -SessionId $setsession_Id