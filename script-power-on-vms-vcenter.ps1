<# 
Script para fazer Power On em todas as VMs do Vcenter
Data: 10/02/2021
#>

$vCenter = "172.20.1.82"
$User = "administrator@vsphere.local"
$Password = "RYVc5MZSHVAh3!UIMncK"
$VM = "vtzabbix01"

Write-Output "Connectando ao vCenter..."
Connect-VIServer -Server $vCenter -Protocol https -User $User -Password $Password

#Write-Output "stop vtzabbix01"
#Get-VM stop-vm $VM -Confirm:$false
#Get-VM $VM| Stop-VM -confirm:$false

#Get-VM | where {$_.Name -eq "vtzabbix01"} | Select-Object Name,NumCPU,MemoryMB,PowerState,Host | Write-Host

#Listando todas a  VMS
#$VMs = Get-VM | where {$_.PowerState -eq "PoweredOn" -and $_.Name -notlike "NTNX*"}
#Write-Host $VMs

#Get-VM | where {$_.PowerState -eq "PoweredOn" -and $_.Name -notlike "NTNX*"} | Select-Object Name,NumCPU,MemoryMB,PowerState,Host | Write-Host 

$VM = Get-VM | where {$_.PowerState -eq "PoweredOn" -and $_.Name -notlike "NTNX*"} | Select-Object Name,NumCPU,MemoryMB,PowerState,Host
foreach ($V in $VM){
    #$V = Select-Object Name,NumCPU,MemoryMB,PowerState,Host
    If($V.Name -eq "vtzabbix01" -and $V.PowerState -eq "PoweredOn" ){
    Write-Host $V.Name,$V.PowerState "VM Desligada"
}
}

Write-Output "Desconnectando do vCenter..."
Disconnect-VIServer -Server $vCenter -Confirm:$false
exit
