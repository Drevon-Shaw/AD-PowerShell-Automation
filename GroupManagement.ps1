Import-Module ActiveDirectory

$samAccount = "ljackson"
$groupName = "IT-Team"

# Check current membership
Write-Host "Current groups for $samAccount"
Get-ADPrincipalGroupMembership -Identity $samAccount | Select-Object Name

# Add to group
Add-ADGroupMember -Identity $groupName -Members $samAccount
Write-Host "Added $samAccount to $groupName"

# Verify add
Write-Host "Updated groups for $samAccount"
Get-ADPrincipalGroupMembership -Identity $samAccount | Select-Object Name

# Remove from group
Remove-ADGroupMember -Identity $groupName -Members $samAccount -Confirm:$false
Write-Host "Removed $samAccount from $groupName"

# Verify removal
Write-Host "Final groups for $samAccount"
Get-ADPrincipalGroupMembership -Identity $samAccount | Select-Object Name
