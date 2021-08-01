$newdisk = @(get-disk | Where-Object partitionstyle -eq 'raw')

for($i = 0; $i -lt $newdisk.Count ; $i++)
{

$disknum = $newdisk[$i].Number
$dl = get-Disk $disknum | 
Initialize-Disk -PartitionStyle GPT -PassThru | 
New-Partition -AssignDriveLetter -UseMaximumSize
Format-Volume -driveletter $dl.Driveletter -FileSystem NTFS -Confirm:$false


}
