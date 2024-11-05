                     
                     #pre definedpassword
                     $user = 'janedoe@netcon.in'
                     $username1 = ''
                     $password1 = ''
                     $pass1= ConvertTo-SecureString $password1 -AsPlainText -Force
                     $azure_cred = New-Object System.Management.Automation.PsCredential( $username1, $pass1 )
                     $connect= Connect-AzureAD -Credential $azure_cred -WarningAction Ignore -Confirm:$false -Tenant "" 
                     $password = ConvertTo-SecureString 'MyNewPassword@123' -AsPlainText -Force
                     $set_password= Set-AzureADUserPassword -ObjectId  $user -Password $password -ForceChangePasswordNextLogin $true
                     $body = "Hi,
                      As requested, the password has been reset for the machine:
                        
                      VM Name : $vm_name
                      Username: $user
                      New Password: $password

 
                      For security reasons, please ensure that you:
                      Do not share these credentials with anyone who is not authorized to access the server.
                      Change the password upon your first login to maintain security.
                      Use a secure connection when accessing the server.
 
                      If you encounter any issues or have any questions, please feel free to reach out to netconncmp@netcon.in.
 
                      Best regards,
                      Automation Team"
                      $username = ""
                      $password = "" # Consider using a secure string for passwords
                      # Create a secure password
                      $securePassword = ConvertTo-SecureString $password -AsPlainText -Force
                      # Create a new PSCredential object
                      $credential = New-Object System.Management.Automation.PSCredential($username, $securePassword)
                      # Send the email
                      Send-MailMessage -SmtpServer "" -Port 587 -From "test@netcon.in" -To "" -Bcc '' -Subject " Report" -Body $body -BodyAsHtml  -Credential $Credential -UseSsl
