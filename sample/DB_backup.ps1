$Path = "C:\Users\SRVASP-RDMDVOPS\actions-runner\Github\atp-rdm-support\atp-rdm-support\RDM\Deployment\Listfile.txt"
$currentDate = get-date -format "yyyyMMdd_HHmmss"
$values = Get-Content $Path | Out-String | ConvertFrom-StringData
$values.GetEnumerator() | ForEach-Object{
$Table= '{0}' -f $_.key,$_.value
$Database = '{1} ' -f $_.key,$_.value 
#$Table 
$Database


Invoke-Sqlcmd -ServerInstance EMAVSP000005154  "BACKUP DATABASE $Database TO DISK = 'H:\RDM\Test_Backup\RDM_db_Rollback_for$currentDate$Database Deployment.bak' WITH COPY_ONLY;"
}
