$ErrorActionPreference = 'Stop'

$packageName = 'utlx'
$url = 'https://github.com/grauwen/utl-x/releases/download/v1.3.1/utlx-windows-x64.exe'
$checksum = 'aa241d30dcb705391d79902ef0948174fdb128078214492ce6d2216d5a3bd63e'
$checksumType = 'sha256'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path $toolsDir 'bin'

# Create install directory
New-Item -ItemType Directory -Force -Path $installDir | Out-Null

# Download the binary
$exePath = Join-Path $installDir 'utlx.exe'
Get-ChocolateyWebFile -PackageName $packageName `
  -FileFullPath $exePath `
  -Url $url `
  -Checksum $checksum `
  -ChecksumType $checksumType

# Create a shim so 'utlx' is available on PATH
Install-BinFile -Name 'utlx' -Path $exePath

Write-Host "UTL-X v1.3.1 installed successfully!" -ForegroundColor Green
Write-Host "Try: utlx --version" -ForegroundColor Cyan
