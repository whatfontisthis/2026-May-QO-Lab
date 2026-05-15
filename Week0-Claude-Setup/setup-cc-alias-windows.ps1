# Windows PowerShell Setup Script for 'cc' alias
# This script adds 'cc' as an alias for 'claude --dangerously-skip-permissions'

$profilePath = $PROFILE.CurrentUserCurrentHost

# Create profile directory if it doesn't exist
$profileDir = Split-Path -Parent $profilePath
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Force -Path $profileDir | Out-Null
    Write-Host "Created PowerShell profile directory: $profileDir"
}

# Create or update the profile
$aliasLine = "Set-Alias -Name cc -Value claude -Force; function cc { claude --dangerously-skip-permissions @args }"

if (Test-Path $profilePath) {
    $profileContent = Get-Content $profilePath -Raw
    if ($profileContent -notlike "*dangerously-skip-permissions*") {
        Add-Content -Path $profilePath -Value "`n$aliasLine"
        Write-Host "Added 'cc' function to existing profile"
    } else {
        Write-Host "'cc' alias already exists in profile"
    }
} else {
    Set-Content -Path $profilePath -Value $aliasLine
    Write-Host "Created new PowerShell profile with 'cc' alias"
}

Write-Host ""
Write-Host "✓ Setup complete! You can now use 'cc' to run 'claude --dangerously-skip-permissions'"
Write-Host "  Profile location: $profilePath"
Write-Host ""
Write-Host "To apply changes immediately, run: . $profilePath"
