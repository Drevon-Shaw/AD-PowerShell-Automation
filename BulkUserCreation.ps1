Import-Module ActiveDirectory

$csvPath = "C:\Users\Administrator\Desktop\users.csv"
$users = Import-Csv $csvPath

foreach ($user in $users) {
    
    $ouPath = "OU=$($user.OU),DC=LAB,DC=local"
    $samAccount = $user.Username
    
    $userParams = @{
        GivenName             = $user.FirstName
        Surname               = $user.LastName
        Name                  = "$($user.FirstName) $($user.LastName)"
        SamAccountName        = $samAccount
        UserPrincipalName     = "$($samAccount)@LAB.local"
        AccountPassword       = (ConvertTo-SecureString $user.Password -AsPlainText -Force)
        Department            = $user.Department
        Title                 = $user.JobTitle
        Path                  = $ouPath
        Enabled               = $true
        ChangePasswordAtLogon = $true
    }
    
    if (Get-ADUser -Filter "SamAccountName -eq '$samAccount'" -ErrorAction SilentlyContinue) {
        Write-Host "User $samAccount already exists - skipping"
    }
    else {
        New-ADUser @userParams
        Write-Host "Created user: $samAccount in OU: $($user.OU)"
    }
}

Write-Host "Bulk user creation complete!"
