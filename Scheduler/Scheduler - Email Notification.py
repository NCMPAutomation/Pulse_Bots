import smtplib

server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login("your_email", "password")
server.sendmail("from_email", "to_email", "Task Reminder")