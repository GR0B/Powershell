# Rob 2026-05-19
# Monitors the WiFi quality on Windows
# Note: On Win11 due to security restrictions, Location services needs to be enabled and this script run as Admistrator to access wifi info, as wifi data can be used for location tracking.

while ($true) {
    $wifi = netsh wlan show interfaces
    $ssid    = ($wifi | Select-String "SSID" | Select-Object -First 1).ToString().Split(":")[1].Trim()
    $channel = ($wifi | Select-String "Channel").ToString().Split(":")[1].Trim()
    $rxrate  = ($wifi | Select-String "Receive rate").ToString().Split(":")[1].Trim()
    $txrate  = ($wifi | Select-String "Transmit rate").ToString().Split(":")[1].Trim()
    $signal  = ($wifi | Select-String "Signal").ToString().Split(":")[1].Trim()
    $rssi    = ($wifi | Select-String "RSSI").ToString().Split(":")[1].Trim()
    
    $pingOutput = ping 1.1.1.1 -n 1 | Out-String
    if ($pingOutput -match "time[=<]\s*(\d+)\s*ms") {
        $time = "$($matches[1]) ms"
    } else {
        $time = "lost"
    }

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Output "$timestamp | SSID=$ssid | Ch=$channel | RX=$rxrate Mbps | TX=$txrate Mbps | Signal=$signal | RSSI=$rssi dBm | Ping=$time"

    Start-Sleep -Seconds 15
}
