<#
    .SYNOPSIS
        Sends basic machine and public IP details to a Discord webhook
        Author: @GR0B
        License: BSD 3-Clause
        Required Dependencies: None
        Optional Dependencies: None
    .DESCRIPTION
        Sends basic machine and public IP details to a Discord webhook, I use this to get alerted when a machine boots and to see it's location and config
    .EXAMPLE
        DiscordPost -Uri https://discord.com/api/webhooks/10546475465392/enxWpPzGO3k0_HW8jkhsadfkhqE4dXF5yfmZa9g-rDQy9ww6MiB2gOEvoDHKJ7BrN
        But use a real webhook Uri
#>

    param(
        [Parameter(Mandatory=$True)]
        [String]
        $Uri        
    )
  
    $r = Invoke-RestMethod -Uri https://ipinfo.io/json 
    $s = Get-ComputerInfo

    $Body = @{
      "username" = "$env:username@$env:computername";
      "content" = "System Booted `n $env:username@$env:computername IP: $($r.ip)`n Timezone: $($r.timezone)`n City: $($r.city) Region: $($r.region) Country: $($r.country)`n $($s.OsName) $($s.OsVersion)`n $($s.CsProcessors.name)`n Ram: $($s.CsTotalPhysicalMemory) $($s.CsDomain)`n $($s.TimeZone)`n Localtime: $($s.OsLocalDateTime)`n LastBoot: $($s.OsLastBootUpTime) Uptime: $($s.OsUptime)";
    };
    Invoke-RestMethod -Uri $Uri -Method 'post' -Body $Body
