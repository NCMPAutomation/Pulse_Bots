# Specify the source path and destination path
$SourcePath = "\\InformaticaServer\Logs\Workflow"
$DestinationPath = "C:\LocalLogs"

# Copy log files
Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse