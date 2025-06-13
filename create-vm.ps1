$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmName = "MyVM"

# Create resource group
New-AzResourceGroup -Name $resourceGroup -Location $location -Force

# Create credential object directly
$username = "azureuser"
$password = ConvertTo-SecureString "Deepanshu1@2" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($username, $password)

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
