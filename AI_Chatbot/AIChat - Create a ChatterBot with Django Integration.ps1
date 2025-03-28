# Import necessary libraries
Add-Type -AssemblyName System.Windows.Forms
$pythonCode = @"
from chatterbot import ChatBot

chatbot = ChatBot(
    'DjangoBot',
    storage_adapter='chatterbot.storage.DjangoStorageAdapter',
    database_uri='sqlite:///db.sqlite3'
)
print('ChatterBot with Django integration created successfully')
"@
# Execute Python code
python -c $pythonCode
