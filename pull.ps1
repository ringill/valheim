param (
   [string]$shared="D:/public/Valheim",
   [string]$irongate="C:/Users/Ringill/AppData/LocalLow/IronGate"
)

$sharedworlds = "$shared/worlds"
$valheim = "$irongate/Valheim"
$localWorlds = "$valheim/worlds"
$backupFolder = Get-Date -UFormat "%d%m%Y"
$backupFolder = "$irongate/Valheim.$backupFolder"

Write-Host "shared: $shared"
Write-Host "irongate: $irongate"
Write-Host "sharedworlds: $sharedworlds"
Write-Host "valheim: $valheim"
Write-Host "localWorlds: $localWorlds"
Write-Host "backupFolder: $backupFolder"

New-Item $backupFolder -ItemType Directory -Force
# забэкапить, если есть что
Copy-Item "$valheim/*" $backupFolder -Recurse -Force
# чистим целевую папку
Remove-Item $localWorlds -Recurse
New-Item $localWorlds -ItemType Directory
# скопировать исходную папку
Copy-Item "$sharedworlds/*" $localWorlds -Recurse

Write-Host "Press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")