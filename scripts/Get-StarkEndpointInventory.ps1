
$OutputPath = "C:\ProgramData\StarkIndustries"
$OutputFile = "$OutputPath\EndpointInventory.txt"

New-Item -Path $OutputPath -ItemType Directory -Force | Out-Null

$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$OperatingSystem = Get-CimInstance Win32_OperatingSystem
$BIOS = Get-CimInstance Win32_BIOS

@"
Computer Name: $env:COMPUTERNAME
Manufacturer: $($ComputerSystem.Manufacturer)
Model: $($ComputerSystem.Model)
Windows Version: $($OperatingSystem.Caption)
OS Build: $($OperatingSystem.BuildNumber)
BIOS Version: $($BIOS.SMBIOSBIOSVersion)
Inventory Date: $(Get-Date)
"@ | Set-Content -Path $OutputFile
