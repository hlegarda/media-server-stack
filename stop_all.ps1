$BaseDir = Join-Path -Path (Get-Location) -ChildPath "/"

$services = @(
    "jellyfin",
    "navidrome",
    "nginx-proxy-manager",
    "plex"
)

foreach ($service in $services) {
    $servicePath = Join-Path -Path $BaseDir -ChildPath $service
    Write-Host "Stopping $service..."

    if (Test-Path $servicePath) {
        Push-Location $servicePath
        docker compose stop
        Pop-Location
    } else {
        Write-Warning "Directory $servicePath does not exist!"
    }
}

Write-Host "All services stopped."
