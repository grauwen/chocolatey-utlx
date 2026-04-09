$ErrorActionPreference = 'Stop'

$packageName = 'utlx'
$url = 'https://github.com/grauwen/utl-x/releases/download/v1.0.1/utlx-windows-x64.exe'
$checksum = '8738768f0a180ddea1734c4f6b8c18b7f268346d07c02b5b8cce850be93f0f8c'
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

Write-Host "UTL-X v1.0.1 installed successfully!" -ForegroundColor Green
Write-Host "Try: utlx --version" -ForegroundColor Cyan
