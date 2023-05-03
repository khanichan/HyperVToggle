#Hyper-V Toggle script
#Made By Andrea Robertsen
#Prompt user to enable or disable Hyper-V
$action = Read-Host "Do you want to enable or disable Hyper-V? Type Enable, Disable, AddFeature or RemoveFeature"

if ($action -eq "Enable") {
    #Enable Hyper-V
    bcdedit /set hypervisorlaunchtype auto
    Write-Host "Hyper-V has been Enabled"
}
elseif ($action -eq "Disable") {
    #Disable Hyper-V
    bcdedit /set hypervisorlaunchtype off
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f
    Write-Host "Hyper-V has been disabled"
}
elseif ($action -eq "AddFeature") {
    #Enable Hyper-V
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
    Write-Host "Hyper-V Feature has been Added"
    Read-Host "Press Enter to exit"
}
elseif ($action -eq "RemoveFeature") {
    #Disable Hyper-V
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
    Write-Host "Hyper-V has Feature been Removed"
    Read-Host -Prompt "Press any key to continue. . ."}
elseif (($action -eq "help") -or ($action -eq "Help") -or ($action -eq "HELP") ) {
    Write-Host "Enable - Enables Hyper-V after disabling it previously with bcdedit and registry command."
    Write-Host "Disable - Disables Hyper-V with a bcdedit with registry command (bcdedit, reg add)"
    Write-Host "AddFeature - Adds Hyper-V Feature with Enable-WindowsOptionalFeature"
    Write-Host "RemoveFeature - Removes Hyper-V Feature with Disable-WindowsOptionalFeature"
}
else {
    Write-Host "Invalid input. Please type Enable, Disable, AddFeature or RemoveFeature"
}
Read-Host -Prompt "Press any key to exit. . ."
exit
