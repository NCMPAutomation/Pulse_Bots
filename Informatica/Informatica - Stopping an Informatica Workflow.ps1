# Provide Workflow details
$WorkflowName = "Sample_Workflow"
$DomainName = "Informatica_Domain"
$IntegrationService = "Integration_Service"

# Use pmcmd to stop the workflow
Start-Process -FilePath "pmcmd" -ArgumentList "stopworkflow -sv $IntegrationService -d $DomainName -wf $WorkflowName"