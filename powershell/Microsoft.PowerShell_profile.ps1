# History settings (matching zsh config)
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -MaximumHistoryCount 10000

# Arrow key history search (matching zsh bindkey config)
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Aliases (from nix-anywhere zsh config)
Set-Alias -Name c -Value Clear-Host
Set-Alias -Name v -Value nvim -ErrorAction SilentlyContinue

function gs { git status $args }
function ga { git add $args }
function gc { git commit $args }
function gp { git push $args }
function gl { git pull $args }
function gco { git checkout $args }
function gcb { git checkout -b $args }

# Use eza if available, otherwise fallback
if (Get-Command eza -ErrorAction SilentlyContinue) {
  function ls { eza --icons=always $args }
  function ll { eza -la --icons=always $args }
  function la { eza -a --icons=always $args }
  function lla { eza -la --icons=always $args }
  function lt { eza --tree --icons=always $args }
  function l { eza -l --icons=always $args }
}

# Use bat if available
if (Get-Command bat -ErrorAction SilentlyContinue) {
  Set-Alias -Name cat -Value bat
}

# Zoxide integration
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# FZF integration
if (Get-Command fzf -ErrorAction SilentlyContinue) {
  Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
}

# Starship prompt
if (Get-Command starship -ErrorAction SilentlyContinue) {
  Invoke-Expression (&starship init powershell)
}
