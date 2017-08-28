#get vm stats for the last 

$VMFolder = @()
Foreach ($VM in (Get-VM |Get-View)){
$Details = “” |Select-Object VM,Path
$Folder = ((($VM.Summary.Config.VmPathName).Split(‘]‘)[1]).Split(‘/‘))[0].TrimStart(‘ ‘)
$Path = ($VM.Summary.Config.VmPathName).Split(‘/‘)[0]
If ($VM.Name-ne $Folder){
$Details.VM= $VM.Name
$Details.Path= $Path
$VMFolder += $Details
 }
 }
$VMFolder 

#    |Export-Csv -NoTypeInformation Mismatch.csv