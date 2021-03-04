function Menu
{
    param(
        [string]$Title = "Escolha um Opcao"
    )
    Clear-Host
    Write-Host "====================== $Title ===================="
    Write-Host "Digite 1 para Power On"
    Write-Host "Digite 2 para Power Off"
    Write-Host "Digite 3 para listar VMs"
    Write-Host "Digite S para Sair "
}

#Import-Module -Name C:\scripts\menu.ps1
do {
    Menu -Title "Script PowerOn/PowerOff"
    $Valor = Read-Host "Escolha uma Opcao"
    Switch ($Valor)
    {
     '1' {Get-VM vtzabbix01| Start-VM -confirm:$false}
     '2' {& "C:\scripts\script-power-on-vms-vcenter-01.ps1"} 
     '3' {& "C:\scripts\listar-vms.ps1"}  
    }
Pause
} until ($Valor -eq 'S')
