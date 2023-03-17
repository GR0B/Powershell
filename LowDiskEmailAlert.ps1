# Robert Sturzbecher 2023
# Send an email alert if disk space is low
# Create a scheduled task with the Trigger of "on an event" Log=System, Source=System, Event ID= 2013

# Create the action to run "Powershell" with the line below as an argument
Send-MailMessage -SmtpServer 127.0.0.1 -From Alerts@ABCWidgets.com.au -To it@ABCWidgets.com.au -Subject "Alert: Server $env:computername Low disk space" -Body "Hello, This is an Automated Alert to inform that the $env:computername Server is low on diskspace." 
