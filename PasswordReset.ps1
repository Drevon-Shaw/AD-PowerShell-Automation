Import-Module ActiveDirectory

$samAccount = "ljackson"

Set-ADAccountPassword -Identity $samAccount `
    -Reset `
    -NewPassword (ConvertTo-SecureString "NewPassword123!" -AsPlainText -Force)

Set-ADUser -Identity $samAccount -ChangePasswordAtLogon $true

Write-Host "Password reset complete for $samAccount"
