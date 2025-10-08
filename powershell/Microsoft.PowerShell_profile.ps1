#Aliases
Set-Alias cls clear
Set-Alias vim nvim
Set-Alias s spf

#Prompt 
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/spaceship.omp.json" | Invoke-Expression #set ohmyposh powershell prompt theme
Invoke-Expression (&starship init powershell) #set starship as powershell prompt theme

#winfetch startup
#winfetch #show system information using winfetch

#fastfetch startup
fastfetch #show system info in a fastway using fastfetch

#Terminal Icons
Import-Module Terminal-Icons

#zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

#PSReadLine
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView

#Yazi terminal file manager
$Env:YAZI_FILE_ONE = 'C:\Program Files\Git\usr\bin\file.exe'

#Yazi terminal file manager
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58


#spf terminal file manager
function spf() {
    param (
        [string[]]$Params
    )
    $spf_location = "C:\Users\James Michael\AppData\Local\Microsoft\WinGet\Packages\yorukot.superfile_Microsoft.Winget.Source_8wekyb3d8bbwe\dist\superfile-windows-v1.3.3-amd64\spf.exe"
    $SPF_LAST_DIR_PATH = [Environment]::GetFolderPath("LocalApplicationData") + "\superfile\lastdir"

    & $spf_location @Params

    if (Test-Path $SPF_LAST_DIR_PATH) {
        $SPF_LAST_DIR = Get-Content -Path $SPF_LAST_DIR_PATH
        Invoke-Expression $SPF_LAST_DIR
        Remove-Item -Force $SPF_LAST_DIR_PATH
    }
}
