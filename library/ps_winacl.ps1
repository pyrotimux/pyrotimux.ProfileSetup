#!powershell
# WANT_JSON
# POWERSHELL_COMMON
$result = New-Object psobject

$params = Parse-Args $args;

$path = Get-Attr $params "Path" -failifempty $true
$perms = Get-Attr $params "Permissions" -failifempty $true
$user = Get-Attr $params "User" -failifempty $true
$prorule = Get-Attr $params "InheritFlags" "None"
$contype = Get-Attr $params "ControlType" "Allow"

$objs = Get-Acl $path
$counter = 0 
$found = $false
$objs.Access | ForEach-Object { 
    $b = ([string]($_.IdentityReference)).Split("\")[1] -eq $user
    if($b){
        Write-Host " this is $counter" 
        $found = $true
         }
    if(-not $found){$counter++}
    
}
if($found){
    $c_perm =  $objs.Access[$counter].FileSystemRights -eq $perms
    $c_inherit =  $objs.Access[$counter].InheritanceFlags -eq $prorule
    if($c_perm -and $c_inherit){
        
		Set-Attr $result "ok" $true
        Exit-Json $result

    }
}



$acl = (Get-Item $path).GetAccessControl('Access')

# ContainerInherit,ObjectInherit "Write, Read, Synchronize"
$ar = New-Object System.Security.AccessControl.FileSystemAccessRule($user, $perms, $prorule, 'None', 'Allow')
$acl.SetAccessRule($ar)
Set-Acl -path $path -AclObject $acl

Set-Attr $result "changed" $true
Exit-Json $result
