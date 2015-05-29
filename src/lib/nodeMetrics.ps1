#This calculates the system calls of all machines
$wait = 30

Add-PSSnapIn Microsoft.HPC;

while(1) {
$timestamp = Get-Date -Format "yyyy/MM/dd HH:mm:ss zzz"

$COLLECT = Get-HpcNode
 foreach ($NODE in $COLLECT) 
 {
  $ARRAY = @()
    $OUT = Get-HpcMetricValue -Node $NODE
    foreach ($LINE in $OUT){
    $ARRAY += ($LINE.Metric.ToString() + "=" + $LINE.Value.ToString()) 
    }
    $LOG = Write-Host $timestamp "{ `"Node`":`""$NODE.NetBiosName"`",`"NodeState`":`""$NODE.NodeState"`",`"NodeHealth`":`""$NODE.NodeHealth"`",`"ServiceHealth`":`""$Node.ServiceHealth"`",`"Template`":`""$NODE.Template"`",`"Groups`":`""$NODE.Groups"`",`"Location`":`""$NODE.Location"`",`"Cores`":`""$NODE.ProcessorCores"`",`"SubscribedCores`":`""$NODE.SubscribedCores"`",`"HealthState`":`""$NODE.HealthState"`",`"Affinity`":`""$Node.Affinity"`",`"Sockets`":`""$Node.Sockets"`",`"SubscribedSockets`":`""$NODE.SubscribedSockets"`",`"Role`":`""$NODE.NodeRole "`",`"Version`":`""$NODE.Version "`",`"NodeStats`":`""$ARRAY"`" }"
    $LOG
    
}
Sleep $wait
}
