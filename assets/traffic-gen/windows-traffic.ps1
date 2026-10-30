param(
    [Parameter(Mandatory = $true)]
    [string]$HubIp,
    [int]$Iterations = 20,
    [int]$SleepSec = 2,
    [int]$HubHttpsPort = 443,
    [int]$HubHttpPort = 80
)

Write-Host "[1/4] Allow traffic to $HubIp`:$HubHttpsPort"
1..$Iterations | ForEach-Object {
    Test-NetConnection -ComputerName $HubIp -Port $HubHttpsPort -WarningAction SilentlyContinue | Out-Null
    Start-Sleep -Seconds $SleepSec
}

Write-Host "[2/4] Deny traffic to $HubIp`:$HubHttpPort"
1..$Iterations | ForEach-Object {
    Test-NetConnection -ComputerName $HubIp -Port $HubHttpPort -WarningAction SilentlyContinue | Out-Null
    Start-Sleep -Seconds $SleepSec
}

Write-Host "[3/4] Allow app traffic to microsoft.com"
1..$Iterations | ForEach-Object {
    try { Invoke-WebRequest -Uri "https://www.microsoft.com" -UseBasicParsing -TimeoutSec 5 | Out-Null } catch {}
    Start-Sleep -Seconds $SleepSec
}

Write-Host "[4/4] Likely-deny app traffic to example.org"
1..$Iterations | ForEach-Object {
    try { Invoke-WebRequest -Uri "https://example.org" -UseBasicParsing -TimeoutSec 5 | Out-Null } catch {}
    Start-Sleep -Seconds $SleepSec
}

Write-Host "Traffic generation completed."

