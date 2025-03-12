     $location = "Central India"
     $location1=($location -split " " |% { $_[0] }) -join ""
     function db_fetch{
     
              # Number fetch from DB

              $mysql_server = "localhost"

              $mysql_user = "root"

              $mysql_password = "Netcondevops@1234$"

              $dbName = "vm_schema"

              [void][system.reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySql.Data.dll")

              $Connection = New-Object -TypeName MySql.Data.MySqlClient.MySqlConnection

              $Connection.ConnectionString = "SERVER=$mysql_server;DATABASE=$dbName;UID=$mysql_user;PWD=$mysql_password"

              $Connection.Open()

              $output_path = "C:\temp\mysql_output.csv"

              $sql = New-Object MySql.Data.MySqlClient.MySqlCommand

              $sql.Connection = $Connection

              $sql.CommandText = "SELECT * FROM vm_schema.vm_table;"

              $dataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($sql)

              $dataSet = New-Object System.Data.DataSet

              $dataAdapter.Fill($dataSet) | Out-Null

              #$dataSet.Tables[0]

              $windowscount = $dataSet.Tables.windows_count

              $linux_count = $dataSet.Tables.Linux_count

              #$dataSet.Tables[0] | Export-Csv -path $output_path -NoTypeInformation
              return $windowscount,$linux_count
              $Connection.Close()
              #************************************************************************************************************#

     }

     function win_create{
     $num1=[int]$windowscount+1
     $vmname="Netcon-win-VM"+$num1
     $port_num=3389

     $ip="Windowstestvm"+$num1
     #********************* CREATING VM IN AZURE ********************************#

              $username1 = 'netdevopsid@netcon.in'
              $password1 = 'D3v0ps@321'
              $pass1= ConvertTo-SecureString $password1 -AsPlainText -Force
              $azure_cred = New-Object System.Management.Automation.PsCredential( $username1, $pass1 )
              $connect=Connect-AzAccount -Credential $azure_cred
              $username = 'Netcon_POC'

                Function Get-RandomPassword
                {
                    #define parameters
                    param([Parameter(Mandatory)][ValidateRange(1,256)][int]$PasswordLength = 10)
                    #ASCII Character set for Password
                    $CharacterSet = @{
                            Lowercase   = (97..122) | Get-Random -Count 10 | % {[char]$_}
                            Uppercase   = (65..90)  | Get-Random -Count 10 | % {[char]$_}
                            Numeric     = (48..57)  | Get-Random -Count 10 | % {[char]$_}
                            SpecialChar = (35..42) | Get-Random -Count 10 | % {[char]$_}
                    }
                    #Frame Random Password from given character set
                    $StringSet = $CharacterSet.Uppercase + $CharacterSet.Lowercase + $CharacterSet.Numeric + $CharacterSet.SpecialChar
                    -join(Get-Random -Count $PasswordLength -InputObject $StringSet)
                }
                #Call the function to generate random password of 8 characters


              $password = Get-RandomPassword -PasswordLength 8
              $pass = ConvertTo-SecureString $password -AsPlainText -Force
              $new_vm_cred = New-Object System.Management.Automation.PsCredential( $username ,$pass )
              $vmname = $vmname
              $image = "Win2016Datacenter"
              $location = "Central India"
              $resource_group = "Netcon_resource_group"
              $size = "Standard_D2s_v3"             
              $vmParams = @{
              ResourceGroupName = $resource_group
              Name = $vmname
              Location = $location
              ImageName = $image
              PublicIpAddressName = $ip
              Credential = $new_vm_cred
              OpenPorts = $port_num,22
              Size = $size
              }
              $newVM1 = New-AzVM @vmParams

              $vmcheck=Get-AzVM -ResourceGroupName $resource_group -Name "$vmname"

              $data=$vmcheck.Id

              $stop=Stop-AzVM -ResourceGroupName $resource_group -Name $vmname -Force

              #************************************************************************************************************#

              #DB update

              if($data -ne $Null){

              $VM_creation_output= "Successufully created the VM with vm name $vmname  Username: $username and Password: $password"

              $mysql_server = "localhost"

              $mysql_user = "root"

              $mysql_password = "Netcondevops@1234$"

              $dbName = "vm_schema"

              [void][system.reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySql.Data.dll")

              $Connection = New-Object -TypeName MySql.Data.MySqlClient.MySqlConnection

              $Connection.ConnectionString = "SERVER=$mysql_server;DATABASE=$dbName;UID=$mysql_user;PWD=$mysql_password"

              $Connection.Open()

              $output_path = "C:\temp\mysql_output.csv"

              $sql = New-Object MySql.Data.MySqlClient.MySqlCommand

              $sql.Connection = $Connection

              $sql.CommandText = "UPDATE vm_schema.vm_table SET `windows_count`=$num1;"

              $dataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($sql)

              $dataSet = New-Object System.Data.DataSet

              $dataAdapter.Fill($dataSet) | Out-Null

              $dataSet.Tables[0]

              #$dataSet.Tables[0] | Export-Csv -path $output_path -NoTypeInformation

              $Connection.Close()

              }

              else

              {

              $VM_creation_output ="Unable to create VM, hence reassigning the ticket to Support team for further investigation."

              }

              return $VM_creation_output
     }
     
     function lin_create{
     $num2=[int]$linux_count+1
     $vmname="Linux"+$location1+$num2
     $port_num=22
     $ip = $vmname
     #********************* CREATING VM IN AZURE ********************************#

              $username1 = 'netdevopsid@netcon.in'

              $password1 = 'D3v0ps@321'

              $pass1= ConvertTo-SecureString $password1 -AsPlainText -Force

              $azure_cred = New-Object System.Management.Automation.PsCredential( $username1, $pass1 )

              $connect=Connect-AzAccount -Credential $azure_cred

              $username = 'Netcon_POC'

                Function Get-RandomPassword

                {

                    #define parameters

                    param([Parameter(Mandatory)][ValidateRange(1,256)][int]$PasswordLength = 10)

                    #ASCII Character set for Password

                    $CharacterSet = @{

                            Lowercase   = (97..122) | Get-Random -Count 10 | % {[char]$_}

                            Uppercase   = (65..90)  | Get-Random -Count 10 | % {[char]$_}

                            Numeric     = (48..57)  | Get-Random -Count 10 | % {[char]$_}

                            SpecialChar = (35..42) | Get-Random -Count 10 | % {[char]$_}

                    }

                    #Frame Random Password from given character set

                    $StringSet = $CharacterSet.Uppercase + $CharacterSet.Lowercase + $CharacterSet.Numeric + $CharacterSet.SpecialChar

                    -join(Get-Random -Count $PasswordLength -InputObject $StringSet)

                }

                #Call the function to generate random password of 8 characters

                #Get-RandomPassword -PasswordLength 12

              $password = Get-RandomPassword -PasswordLength 12

              $pass = ConvertTo-SecureString $password -AsPlainText -Force

              $new_vm_cred = New-Object System.Management.Automation.PsCredential( $username ,$pass )

              $vmname = $vmname
              $image = "RHELRaw8LVMGen2"

              $location = "Central India"

              $resource_group = "Netcon_resource_group"

              $size = "Standard_D2s_v3"

              $vmParams = @{

                ResourceGroupName = $resource_group

                Name = $vmname

                Location = $location

                ImageName = $image

                PublicIpAddressName = $ip

                Credential = $new_vm_cred

                OpenPorts = $port_num

                Size = $size

              }

              $newVM1 = New-AzVM @vmParams

              $vmcheck=Get-AzVM -ResourceGroupName $resource_group -Name "$vmname"

              $data=$vmcheck.Id

              $stop=Stop-AzVM -ResourceGroupName $resource_group -Name $vmname -Force
              
              #************************************************************************************************************#

              #DB update

              if($data -ne $Null){

              $VM_creation_output= "Successufully created the VM with vm name $vmname  Username: $username and Password: $password"

              $mysql_server = "localhost"

              $mysql_user = "root"

              $mysql_password = "Netcondevops@1234$"

              $dbName = "vm_schema"

              [void][system.reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySql.Data.dll")

              $Connection = New-Object -TypeName MySql.Data.MySqlClient.MySqlConnection

              $Connection.ConnectionString = "SERVER=$mysql_server;DATABASE=$dbName;UID=$mysql_user;PWD=$mysql_password"

              $Connection.Open()

              $output_path = "C:\temp\mysql_output.csv"

              $sql = New-Object MySql.Data.MySqlClient.MySqlCommand

              $sql.Connection = $Connection
  
              $sql.CommandText = "UPDATE vm_schema.vm_table SET `Linux_count` =$num2;"
            
              $dataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($sql)

              $dataSet = New-Object System.Data.DataSet

              $dataAdapter.Fill($dataSet) | Out-Null

              $dataSet.Tables[0]

              #$dataSet.Tables[0] | Export-Csv -path $output_path -NoTypeInformation

              $Connection.Close()

              }

              else

              {

              $VM_creation_output ="Unable to create VM, hence reassigning the ticket to Support team for further investigation."

              }

              return $VM_creation_output

     }
     #Script with filters for manage engine

              #********************************************

              $create_linux = 5
              $create_windows = 0

              #************************************************************************************************************#
for($i = 1 ; $i -le $create_windows ; $i++){
    $machine_count=db_fetch
    $windowscount=$machine_count[0]
     #$linux_count=$machine_count[1]
     win_create

}

for($j = 1 ; $j -le $create_linux ; $j++){
    $machine_count=db_fetch
    #$windowscount=$machine_count[0]
     $linux_count=$machine_count[1]
     lin_create

}


              
              