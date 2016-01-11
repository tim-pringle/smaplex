Import-Module Simplex
New-PSDrive -Name SMA -PSProvider Simplex -Root "d:\temp\config.ps1"

$username = "contoso\administrator"
$secpasswd = ConvertTo-SecureString "mypassword" -AsPlainText -Force 
$credential = New-Object System.Management.Automation.PSCredential ($username, $secpasswd)

$smaParameters = @{
Credential = $Credential
WebserviceEndpoint = 'https://sma01'
}