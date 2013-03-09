#By BigTeddy 05 September 2011

#This script uses the .NET FileSystemWatcher class to monitor file events in folder(s).
#The advantage of this method over using WMI eventing is that this can monitor sub-folders.
#The -Action parameter can contain any valid Powershell commands.  I have just included two for example.
#The script can be set to a wildcard filter, and IncludeSubdirectories can be changed to $true.
#You need not subscribe to all three types of event.  All three are shown for example.
# Version 1.1

Unregister-Event FileDeleted | out-null
Unregister-Event FileCreated | out-null
Unregister-Event FileChanged | out-null

$ScriptPath = $MyInvocation.MyCommand.Path
$ScriptDir  = Split-Path -Parent $ScriptPath

$folder = $ScriptDir # Enter the root path you want to monitor.
$filter = '*.html'  # You can enter a wildcard filter here.

# In the following line, you can change 'IncludeSubdirectories to $true if required.                          
$fsw = New-Object IO.FileSystemWatcher $folder, $filter -Property @{EnableRaisingEvents =  $true;IncludeSubdirectories = $true;NotifyFilter = [IO.NotifyFilters]'FileName','LastWrite','LastAccess'}

# Here, all three events are registerd.  You need only subscribe to events that you need:

$global:jekyll = Start-Process -PassThru -NoNewWindow jekyll -Argumentlist "--server" | get-process

Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action {
	$name = $Event.SourceEventArgs.Name
	$changeType = $Event.SourceEventArgs.ChangeType
	$timeStamp = $Event.TimeGenerated
	
	if($name.StartsWith("_site","InvariantCultureIgnoreCase") -eq $false)
	{
		stop-process $global:jekyll | wait-process
		Write-Host "The file '$name' was $changeType at $timeStamp" -fore white
		$global:jekyll = Start-Process -PassThru -NoNewWindow jekyll -Argumentlist "--server" | get-process
	}
}

Register-ObjectEvent $fsw Deleted -SourceIdentifier FileDeleted -Action {
	$name = $Event.SourceEventArgs.Name
	$changeType = $Event.SourceEventArgs.ChangeType
	$timeStamp = $Event.TimeGenerated
	
	if($name.StartsWith("_site","InvariantCultureIgnoreCase") -eq $false)
	{
		stop-process $global:jekyll | wait-process
		Write-Host "The file '$name' was $changeType at $timeStamp" -fore white
		$global:jekyll = Start-Process -PassThru -NoNewWindow jekyll -Argumentlist "--server" | get-process
	}
}

Register-ObjectEvent $fsw Changed -SourceIdentifier FileChanged -Action {
	$name = $Event.SourceEventArgs.Name
	$changeType = $Event.SourceEventArgs.ChangeType
	$timeStamp = $Event.TimeGenerated
	
	if($name.StartsWith("_site","InvariantCultureIgnoreCase") -eq $false)
	{
		stop-process $global:jekyll | wait-process
		Write-Host "The file '$name' was $changeType at $timeStamp" -fore white
		$global:jekyll = Start-Process -PassThru -NoNewWindow jekyll -Argumentlist "--server" | get-process
	}
}

