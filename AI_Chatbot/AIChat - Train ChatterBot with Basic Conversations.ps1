# Import necessary libraries
Add-Type -AssemblyName System.Windows.Forms
$pythonCode = @"
from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer

chatbot = ChatBot('Example Bot')
trainer = ListTrainer(chatbot)

# Train the chatbot with a few responses
trainer.train([
    'Hi',
    'Hello',
    'How are you?',
    'I am good, thank you!',
    'Goodbye',
    'See you later!'
])
print('ChatterBot trained successfully')
"@
# Execute Python code
python -c $pythonCode
