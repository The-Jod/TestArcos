# Forzar búsqueda de actualizaciones
UsoClient StartScan

# Esperar un poco para que inicie la búsqueda (opcional)
Start-Sleep -Seconds 10

# Forzar descarga de actualizaciones
UsoClient StartDownload

# Esperar un poco para que inicie la descarga (opcional)
Start-Sleep -Seconds 20

# Forzar instalación de actualizaciones
UsoClient StartInstall
