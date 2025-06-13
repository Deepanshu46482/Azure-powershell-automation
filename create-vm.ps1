# Define variables
$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = "MyVM"

# Create resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Define credentials (replace with GitHub Secret in production)
$securePassword = ConvertTo-SecureString "YourPassword123!" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("azureuser", $securePassword)

# Create VM
New-AzVM `
    -ResourceGroupName $resourceGroup `
    -Name $vmName `
    -Location $location `
    -VirtualNetworkName "$vmName-Vnet" `
    -SubnetName "$vmName-Subnet" `
    -SecurityGroupName "$vmName-nsg" `
    -PublicIpAddressName "$vmName-ip" `
    -Credential $cred

