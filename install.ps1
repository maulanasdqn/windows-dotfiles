# Windows Dotfiles Installer
# Run: powershell -ExecutionPolicy Bypass -File install.ps1

Write-Host "Installing dotfiles..." -ForegroundColor Cyan

# Install tools via winget
$tools = @(
  "Neovim.Neovim",
  "starship",
  "junegunn.fzf",
  "sharkdp.bat",
  "eza-community.eza",
  "ajeetdsouza.zoxide",
  "DEVCOM.JetBrainsMonoNerdFont"
)

foreach ($tool in $tools) {
  Write-Host "Installing $tool..." -ForegroundColor Yellow
  winget install $tool --accept-package-agreements --accept-source-agreements
}

# Symlink PowerShell profile
$profileDir = Split-Path $PROFILE
if (!(Test-Path $profileDir)) { New-Item -ItemType Directory -Path $profileDir -Force }
Copy-Item -Path "$PSScriptRoot\powershell\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force
Write-Host "PowerShell profile installed to $PROFILE" -ForegroundColor Green

# Symlink Neovim config
$nvimDir = "$env:LOCALAPPDATA\nvim"
if (Test-Path $nvimDir) { Remove-Item -Recurse -Force $nvimDir }
Copy-Item -Recurse -Path "$PSScriptRoot\nvim" -Destination $nvimDir
Write-Host "Neovim config installed to $nvimDir" -ForegroundColor Green

# Symlink Windows Terminal settings
$terminalDir = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
if (Test-Path $terminalDir) {
  Copy-Item -Path "$PSScriptRoot\terminal\settings.json" -Destination "$terminalDir\settings.json" -Force
  Write-Host "Windows Terminal settings installed" -ForegroundColor Green
}

Write-Host "`nDone! Restart your terminal." -ForegroundColor Cyan
