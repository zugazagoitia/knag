param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
# Write: "Choose one of the following adapters:" and wait for the user to input one.
Write-Host "Choose one of the following adapters:" -ForegroundColor DarkGreen -BackgroundColor Black
Write-Host "" -ForegroundColor DarkGreen
Get-NetAdapter
Write-Host "" -ForegroundColor DarkGreen
#Set text to a highlighted color
Write-Host "Enter the name of the adapter you want to configure:" -ForegroundColor DarkGreen -BackgroundColor Black
Write-Host "" -ForegroundColor DarkGreen
$adapterName = Read-Host -Prompt "Adapter Name" -ErrorAction Stop 
Write-Host ""


New-VMSwitch -name "VagrantExternalSwitch" -NetAdapterName $adapterName -AllowManagementOS $true 
