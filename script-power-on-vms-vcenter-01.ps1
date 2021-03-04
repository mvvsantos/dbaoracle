<#  Script para fazer Power On /  Power Off em todas as VMs do Vcenter
    Data: 10/02/2021
#>

$vCenter = "172.20.1.82"
$User = "administrator@vsphere.local"
$Password = "RYVc5MZSHVAh3!UIMncK"
$VM = "vtzabbix01"

Write-Output "Connectando ao vCenter..."
Connect-VIServer -Server $vCenter -Protocol https -User $User -Password $Password

Write-Output "Desligando vtzabbix01"

$VM = Get-VM | where {$_.PowerState -eq "PoweredOn" -and $_.Name -notlike "NTNX*"} | Select-Object Name,NumCPU,MemoryMB,PowerState,Host
foreach ($V in $VM){
    #$V = Select-Object Name,NumCPU,MemoryMB,PowerState,Host
    If($V.Name -eq "vtzabbix01" -and $V.PowerState -eq "PoweredOn" ){
    Get-VM vtzabbix01| Stop-VM -confirm:$false
    Write-Host $V.Name "VM Desligada"
}
}

Write-Output "Desconnectando do vCenter..."
Disconnect-VIServer -Server $vCenter -Confirm:$false
exit
