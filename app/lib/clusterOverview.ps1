$headNode = $args[0]$wait = $args[1]Add-PSSnapIn Microsoft.HPC;while(1) {	Get-HpcClusterOverview -scheduler $headNode | Fl	Write-Host "###"	Sleep $wait}