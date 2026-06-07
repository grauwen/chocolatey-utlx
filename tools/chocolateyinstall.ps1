$ErrorActionPreference = 'Stop'

$packageName = 'utlx'
$url = 'https://github.com/grauwen/utl-x/releases/download/v1.2.2/utlx-windows-x64.exe'
$checksum = 'bba15e206a7c3514c433a797e4a853b6c5f6acb64f2052c38b40363024e3cbb1'
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

Write-Host "UTL-X v1.2.2 installed successfully!" -ForegroundColor Green
Write-Host "Try: utlx --version" -ForegroundColor Cyan
