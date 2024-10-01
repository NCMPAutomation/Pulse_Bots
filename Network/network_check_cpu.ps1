
$username2 = ''
$password2 = ''
$pass2= ConvertTo-SecureString $password2 -AsPlainText -Force
$azure_cred2 = New-Object System.Management.Automation.PsCredential( $username2, $pass2 )

#To check the CPU######################
$setsession = New-SSHSession -ComputerName $IP -Credential $azure_cred2
$setsession_Id = $setsession_Id.id
$Results_CPU = Invoke-SSHCommand -SessionId $setsession_Id -Command "show processes cpu" 
$Results_CPU 
Remove-SSHSession -SessionId $setsession_Id