# Define variables
$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = $resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = "MyVM"

# Suppress prompt if the resource group already exists
New-AzResourceGroup -Name $resourceGroup -Location $location -Force

$cred = Get-Credential

New-AzVM -ResourceGroupName $resourceGroup `
         -Name $vmName `
         -Location $location `
         -VirtualNetworkName "$vmName-Vnet" `
         -SubnetName "$vmName-Subnet" `
         -SecurityGroupName "$vmName-nsg" `
         -PublicIpAddressName "$vmName-ip" `
         -Credential $cred

