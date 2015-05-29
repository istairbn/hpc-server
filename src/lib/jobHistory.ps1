$covertime = (60 * 180)
$duration = (60 * 90)
$ErrorActionPreference = "SilentlyContinue"
$WarningPreference = "SilentlyContinue"
Add-PSSnapIn Microsoft.HPC;
while(1) {
    
    $SINCE = (get-date).addSeconds(-1 * $covertime)
    $NOW = (get-date).addSeconds(-1 * $duration)
    #Write-Host ">>> getting:
	$OUT = Get-HPCJobHistory -StartDate $Since -EndDate $NOW
    foreach ($RECORD in $OUT) 
    { 
           $timestamp = $RECORD.EndTime.ToString("yyyy/MM/dd HH:mm:ss zzz")
            $LOG = $timestamp  + "," + $RECORD.JobId + "," + $RECORD.Service + "," + $RECORD.Type + "," + $RECORD.Event + "," + $RECORD.SubmitTime + "," + $RECORD.StartTime + "," + $RECORD.EndTime + "," + $RECORD.CpuTime + "," + $RECORD.Runtime + "," + $RECORD.MemoryUsed + "," + $RECORD.NumberOfTasks + "," + $RECORD.NumberOfCalls  + "," + $RECORD.CallsPerSecond + "," + $RECORD.Owner + "," + $RECORD.Template + "," + $RECORD.Name + "," + $RECORD.Project + "," + $RECORD.FinishedTasksCount + "," + $RECORD.FailedTasksCount
            Write-Host $LOG
     }
     #Write-Host ">>> sleep:"
	
	Sleep $duration
}
