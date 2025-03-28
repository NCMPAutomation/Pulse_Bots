import os
os.system("mysqldump -u root -p database_name > backup.sql")
print("Backup completed!")
