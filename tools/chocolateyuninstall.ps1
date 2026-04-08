$ErrorActionPreference = 'Stop'

$packageName = 'utlx'

# Remove the shim
Uninstall-BinFile -Name 'utlx'

# Remove the binary
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path $toolsDir 'bin'
if (Test-Path $installDir) {
    Remove-Item -Recurse -Force $installDir
}

Write-Host "UTL-X uninstalled successfully." -ForegroundColor Green
