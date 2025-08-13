# URL de descarga del ZIP de DaVinci Resolve
$zipUrl = "https://swr.cloud.blackmagicdesign.com/DaVinciResolve/v20.1/DaVinci_Resolve_20.1_Windows.zip?verify=1755113252-gKVcKaLt0qMFVAhCvnty2c5SqnssYU0vLPkvzJY5UZQ%3D"

# Rutas temporales
$zipPath = "$env:TEMP\DavinciResolve.zip"
$extractPath = "$env:TEMP\DavinciInstaller"

# Descargar el ZIP
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Crear carpeta para extraer
New-Item -ItemType Directory -Path $extractPath -Force | Out-Null

# Extraer el ZIP
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $extractPath)

# Ruta al archivo .exe extraído
$installerPath = Join-Path $extractPath "DaVinci_Resolve_20.1_Windows.exe"

# Verifica si existe y ejecuta con los parámetros silenciosos
if (Test-Path $installerPath) {
    Start-Process -FilePath $installerPath -ArgumentList "/i /q /noreboot" -Wait
} else {
    Write-Host "ERROR: No se encontró el instalador extraído."
}

# Limpiar temporales
Remove-Item $zipPath -Force
Remove-Item $extractPath -Recurse -Force
