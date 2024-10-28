# Define the URL for the SQL Server installer
$installerUrl = "https://go.microsoft.com/fwlink/?linkid=866658"

# Define the path where the installer will be downloaded
$installerPath = "C:\Temp\SQLServer2019.exe"

# Download the SQL Server installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Run the SQL Server installer
Start-Process -FilePath $installerPath -ArgumentList "/Q /ACTION=Install /IACCEPTSQLSERVERLICENSETERMS /FEATURES=SQLENGINE /INSTANCENAME=MSSQLSERVER /SQLSVCACCOUNT='NT AUTHORITY\SYSTEM' /SQLSYSADMINACCOUNTS='BUILTIN\ADMINISTRATORS'" -Wait
