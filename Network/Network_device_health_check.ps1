
$username2 = ''
$password2 = ''
$pass2= ConvertTo-SecureString $password2 -AsPlainText -Force
$azure_cred2 = New-Object System.Management.Automation.PsCredential( $username2, $pass2 )

#To check the CPU######################
$setsession = New-SSHSession -ComputerName $IP -Credential $azure_cred2
$setsession_Id = $setsession_Id.id
$Results_CPU = Invoke-SSHCommand -SessionId $setsession_Id -Command "show processes cpu" 
$Results_CPU 

#file system########################
$Results_file_system = Invoke-SSHCommand -SessionId $setsession_Id -Command "show file systems" 
$Results_file_system 

#Check Memory########################
$Result_memory = Invoke-SSHCommand -SessionId $setsession_Id -Command "show memory summary" 
$Result_memory 

#Check Latency########################
$Results_latency = Invoke-SSHCommand -SessionId $setsession_Id -Command "show hardware profile latency monitor interface" 
$Results_latency 

#Device status##################################
$Results_device_status = Invoke-SSHCommand -SessionId $setsession_Id -Command "show version" 
$Results_device_status 

#Services check##################################
$Results_service = Invoke-SSHCommand -SessionId $setsession_Id -Command "show running-config all" 
$Results_service

#Port check##################################
$Results_port = Invoke-SSHCommand -SessionId $setsession_Id -Command "port check" 
$Results_port

#Show peer connectivity##################################
$Results_peer_connectivity = Invoke-SSHCommand -SessionId $setsession_Id -Command "show cdp neighbors" 
$Results_peer_connectivity 

#check connected modules##################################
$Results_module = Invoke-SSHCommand -SessionId $setsession_Id -Command "show module" 
$Results_module 

#check cinterface status##################################
$Results_interface = Invoke-SSHCommand -SessionId $setsession_Id -Command "show interface status" 
$Results_interface 

#check config settings##################################
$Results_config = Invoke-SSHCommand -SessionId $setsession_Id -Command "show interfaces switchport" 
$Results_config 

Remove-SSHSession -SessionId $setsession_Id