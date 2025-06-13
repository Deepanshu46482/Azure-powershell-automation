$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = "MyVM"

New-AzResourceGroup -Name $resourceGroup -Location $location

$cred = Get-Credential

New-AzVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -VirtualNetworkName "$vmName-Vnet" `
  -SubnetName "$vmName-Subnet" `
  -SecurityGroupName "$vmName-nsg" `
  -PublicIpAddressName "$vmName-ip" `
  -Credential $cred `
  -ImageName "Canonical:0001-com-ubuntu-server-jammy:22_04-lts:latest" `
  -Size "Standard_B2s"
