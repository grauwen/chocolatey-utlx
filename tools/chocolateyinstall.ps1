$ErrorActionPreference = 'Stop'

$packageName = 'utlx'
$url = 'https://github.com/grauwen/utl-x/releases/download/v1.3.0/utlx-windows-x64.exe'
$checksum = 'd5449120928343ba207b74ac099dbd3661fc78eccb0bea4350d8991ec9720c99'
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

Write-Host "UTL-X v1.3.0 installed successfully!" -ForegroundColor Green
Write-Host "Try: utlx --version" -ForegroundColor Cyan
