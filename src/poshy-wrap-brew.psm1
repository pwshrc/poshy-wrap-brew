#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command brew) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
}

function Invoke-BrewUpdateAndOutdatedCask {
    brew update
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    brew outdated --cask @args
}
Set-Alias -Name bcubo -Value Invoke-BrewUpdateAndOutdatedCask
Export-ModuleMember -Function Invoke-BrewUpdateAndOutdatedCask -Alias bcubo

function Invoke-BrewUpgradeCaskAndCleanup {
    brew upgrade --cask
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    brew cleanup @args
}
Set-Alias -Name bcubc -Value Invoke-BrewUpgradeCaskAndCleanup
Export-ModuleMember -Function Invoke-BrewUpgradeCaskAndCleanup -Alias bcubc

function Invoke-BrewPin {
    brew pin @args
}
Set-Alias -Name brewp -Value Invoke-BrewPin
Export-ModuleMember -Function Invoke-BrewPin -Alias brewp

function Invoke-BrewListPinned {
    brew list --pinned @args
}
Set-Alias -Name brewsp -Value Invoke-BrewListPinned
Export-ModuleMember -Function Invoke-BrewListPinned -Alias brewsp

function Invoke-BrewUpgradeAndCleanup {
    brew upgrade
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    brew cleanup @args
}
Set-Alias -Name bubc -Value Invoke-BrewUpgradeAndCleanup
Export-ModuleMember -Function Invoke-BrewUpgradeAndCleanup -Alias bubc

function Invoke-BrewUpgradeGreedyAndCleanup {
    brew upgrade --greedy
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    brew cleanup @args
}
Set-Alias -Name bugbc -Value Invoke-BrewUpgradeGreedyAndCleanup
Export-ModuleMember -Function Invoke-BrewUpgradeGreedyAndCleanup -Alias bugbc

function Invoke-BrewUpdateAndOutdated {
    brew update
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    brew outdated @args
}
Set-Alias -Name bubo -Value Invoke-BrewUpdateAndOutdated
Export-ModuleMember -Function Invoke-BrewUpdateAndOutdated -Alias bubo

function Invoke-BrewUpdateAndOutdatedAndUpgradeAndCleanup {
    Invoke-BrewUpdateAndOutdated @args
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    Invoke-BrewUpgradeAndCleanup @args
}
Set-Alias -Name bubu -Value Invoke-BrewUpdateAndOutdatedAndUpgradeAndCleanup
Export-ModuleMember -Function Invoke-BrewUpdateAndOutdatedAndUpgradeAndCleanup -Alias bubu

function Invoke-BrewUpdateAndOutdatedAndUpgradeGreedyAndCleanup {
    Invoke-BrewUpdateAndOutdated @args
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    Invoke-BrewUpgradeGreedyAndCleanup @args
}
Set-Alias -Name bubug -Value Invoke-BrewUpdateAndOutdatedAndUpgradeGreedyAndCleanup
Export-ModuleMember -Function Invoke-BrewUpdateAndOutdatedAndUpgradeGreedyAndCleanup -Alias bubug

function Invoke-BrewUpgradeFormula {
    brew upgrade --formula @args
}
Set-Alias -Name bfu -Value Invoke-BrewUpgradeFormula
Export-ModuleMember -Function Invoke-BrewUpgradeFormula -Alias bfu

function Invoke-BrewUninstallZap {
    brew uninstall --zap @args
}
Set-Alias -Name buz -Value Invoke-BrewUninstallZap
Export-ModuleMember -Function Invoke-BrewUninstallZap -Alias buz
