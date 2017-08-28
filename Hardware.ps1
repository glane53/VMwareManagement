# Query for the VM guests
 $VMGuests = get-cluster "Exchange2010" | Get-VM

# Loop through your VM guests, set the VM Tools upgrade checkbox and the Sync Time checkbox to true
 ForEach ($VMGuest in $VMGuests) {
       $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
       $spec.changeVersion = $VMGuest.ExtensionData.Config.ChangeVersion
       $spec.tools = New-Object VMWare.Vim.ToolsConfigInfo
       $spec.tools.toolsUpgradePolicy = “upgradeAtPowerCycle”

      # Apply the changes
       $MyVM = Get-View -Id $VMGuest.Id
       $MyVM.ReconfigVM_Task($spec)
 }