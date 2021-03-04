#$vCenter = "172.20.1.82"
#$User = "administrator@vsphere.local"
#$Password = "RYVc5MZSHVAh3!UIMncK"

#Write-Output "Connectando ao vCenter..."
#Connect-VIServer -Server $vCenter -Protocol https -User $User -Password $Password


$VM = Get-VM | where {$_.PowerState -eq "PoweredOn" -and $_.Name -notlike "NTNX*"} | Select-Object Name,NumCPU,MemoryMB,PowerState,Host
foreach ($V in $VM){
    #$V = Select-Object Name,NumCPU,MemoryMB,PowerState,Host
    Write-Host $V.Name,$V.PowerState
}

#Write-Output "Desconnectando do vCenter..."
#Disconnect-VIServer -Server $vCenter -Confirm:$false
exit