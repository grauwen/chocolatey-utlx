$ErrorActionPreference = 'Stop'

$packageName = 'utlx'
$url = 'https://github.com/grauwen/utl-x/releases/download/v1.0.2/utlx-windows-x64.exe'
$checksum = '18a0c0a970cba324041ae33eb45aff408a4e9779e08814526c92faac12aafcc6'
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

Write-Host "UTL-X v1.0.2 installed successfully!" -ForegroundColor Green
Write-Host "Try: utlx --version" -ForegroundColor Cyan
