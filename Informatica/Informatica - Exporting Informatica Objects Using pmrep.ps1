# Login to Informatica repository
Start-Process -FilePath "pmrep" -ArgumentList "connect -r Repository_Service -d Domain -n UserName -x Password"

# Export Informatica objects
Start-Process -FilePath "pmrep" -ArgumentList "objectexport -o ExportedObjects.xml -f FolderName"