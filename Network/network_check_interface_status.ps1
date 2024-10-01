$username2 = ''
$password2 = ''
$pass2= ConvertTo-SecureString $password2 -AsPlainText -Force
$azure_cred2 = New-Object System.Management.Automation.PsCredential( $username2, $pass2 )


#check cinterface status##################################
$setsession = New-SSHSession -ComputerName $IP -Credential $azure_cred2
$setsession_Id = $setsession_Id.id
$Results_file_system = Invoke-SSHCommand -SessionId 0 -Command "show interface status" 
$Results_file_system 
Remove-SSHSession -SessionId $setsession_Id