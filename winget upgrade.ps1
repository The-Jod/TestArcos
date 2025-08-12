# Verifica si winget está disponible
if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget upgrade --all --silent
} else {
    Write-Output "Winget no está disponible en este equipo."
}

# Verifica si el módulo PSWindowsUpdate está instalado
if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
    Import-Module PSWindowsUpdate
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot
} else {
    Write-Output "El módulo PSWindowsUpdate no está instalado."
}

