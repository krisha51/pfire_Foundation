$Path = "C:\Users\SRVASP-RDMDVOPS\actions-runner\Github\atp-rdm-support\atp-rdm-support\RDM\Deployment\Listfile.txt"
$currentDate = get-date -format "yyyyMMdd_HHmmss"
$values = Get-Content $Path | Out-String | ConvertFrom-StringData
$values.GetEnumerator() | ForEach-Object{
$Table= '{0}' -f $_.key,$_.value
$Database = '{1} ' -f $_.key,$_.value 
$Table 
$Database
$var1=$Table + "_" + "backup" + "_" + "$currentDate"
$var1
Invoke-Sqlcmd -ServerInstance EMAVSP000005154 -Database $Database -Query "select * into $var1 from $Table"
}
