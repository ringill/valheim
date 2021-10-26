param (
   [string]$shared="D:/public/Valheim",
   [string]$localWorlds="C:/Users/Ringill/AppData/LocalLow/IronGate/Valheim/worlds"
)

$sharedworlds = "$shared/worlds"
$backupFolder = Get-Date -UFormat "%d%m%Y"
$backupFolder = "$shared/backup/worlds.$backupFolder"

Write-Host "shared: $shared"
Write-Host "localWorlds: $localWorlds"
Write-Host "sharedworlds: $sharedworlds"
Write-Host "backupFolder: $backupFolder"

New-Item "$shared/backup" -ItemType Directory -Force
New-Item $backupFolder -ItemType Directory -Force
# забэкапить, если есть что
Copy-Item "$sharedworlds/*" $backupFolder -Recurse -Force
# чистим целевую папку
Remove-Item $sharedworlds -Recurse
# скопировать исходную папку
Copy-Item $localWorlds "$shared" -Recurse

Write-Host "Press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")