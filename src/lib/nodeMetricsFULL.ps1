﻿#This calculates the system calls of all machines$wait = 30Add-PSSnapIn Microsoft.HPC;while(1) {$timestamp = Get-Date -Format "yyyy/MM/dd HH:mm:ss zzz"$OUT = Get-HpcMetricValue    foreach ($RECORD in $OUT)   {      $LOG =  $timestamp  + "," +  $RECORD.NodeName  + "," + $RECORD.Metric  + "," +  $RECORD.Value        Write-Host $LOG     }	Sleep $wait}