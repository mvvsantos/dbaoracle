function Menu
{
    param(
        [string]$Title = "Escolha um Opcao"
    )
    Clear-Host
    Write-Host "====================== $Title ===================="
    Write-Host "1: Digite 1 para Power On"
    Write-Host "2: Digite 2 para Power Off"
    Write-Host "S: Digite S para Sair "
}