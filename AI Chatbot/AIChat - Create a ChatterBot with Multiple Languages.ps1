# Import necessary libraries
Add-Type -AssemblyName System.Windows.Forms
$pythonCode = @"
from chatterbot import ChatBot
from chatterbot.trainers import ChatterBotCorpusTrainer

chatbot = ChatBot('Multilingual Bot')
trainer = ChatterBotCorpusTrainer(chatbot)

# Train the chatbot with multiple languages
trainer.train(
    'chatterbot.corpus.english',
    'chatterbot.corpus.spanish'
)
print('ChatterBot trained with multiple languages successfully')
"@
# Execute Python code
python -c $pythonCode
