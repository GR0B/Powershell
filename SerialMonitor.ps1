# Robert Sturzbecher 2025-10-02 
# Serial port monitor, Used to serial connected RFID module   
$port = new-Object System.IO.Ports.SerialPort COM4,9600,None,8,1
$port.Open()
while ($true) {
    if ($port.BytesToRead -gt 0) {
        $data = $port.ReadTo("`r")  # Read until <CR>
 	$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Write-Host "$timestamp `t $data"
    }
    Start-Sleep -Milliseconds 250  # Reduce CPU usage, checks every 250ms	
}

