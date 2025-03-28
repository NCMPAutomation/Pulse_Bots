# Define Informatica workflow details
$WorkflowName = "Sample_Workflow"
$DomainName = "Informatica_Domain"
$IntegrationService = "Integration_Service"

# Run the pmcmd command to start the workflow
Start-Process -FilePath "pmcmd" -ArgumentList "startworkflow -sv $IntegrationService -d $DomainName -wf $WorkflowName"