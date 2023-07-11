I recommend setting it up as a scheduled task in Microsoft Task Scheduler

If unsure you could run this command to set one up (remember to place the file somewhere and point the path below to it)
```
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-ExecutionPolicy Bypass -File "C:\Users\$env:username\Scripts\cleanDirectoties.ps1"'
$trigger = @(
  $(New-ScheduledTaskTrigger -Daily -At 11:00),
  $(New-ScheduledTaskTrigger -AtLogOn)
)
Register-ScheduledTask -Action $action -Trigger $trigger -RunLevel Highest -TaskPath "MyTasks" -TaskName "cleanDirectories" -Description "Stats powershell script to clean selected directories on Logon and at noon daily"
```
