root {
          folder Assets {
         script Connections {
         }
         script Credentials{
                $defaultDisplaySet = 'Name','LastModifiedTime'
           $defaultDisplayPropertySet = New-Object System.Management.Automation.PSPropertySet(‘DefaultDisplayPropertySet’,[string[]]$defaultDisplaySet)
           $PSStandardMembers = [System.Management.Automation.PSMemberInfo[]]@($defaultDisplayPropertySet)
              
           $credentials = Get-SmaCredential @smaParameters
           $credentials.ForEach{
             $hash = @{
               CredentialID=$psitem.CredentialID
               TenantID =$psitem.TenantID
               Name=$psitem.Name
               CreationTime=$psitem.CreationTime
               LastModifiedTime=$psitem.LastModifiedTime
               Password=$psitem.Password
               UserName=$psitem.UserName
               Description=$psitem.Description
             }
         
             $psObject = New-Object -TypeName PSObject -Property $hash
             $psObject | Add-Member MemberSet PSStandardMembers $PSStandardMembers
             $psObject
           }
           }
           script Schedules{
             $defaultDisplaySet = 'Name','LastModifiedTime'
             $defaultDisplayPropertySet = New-Object System.Management.Automation.PSPropertySet(‘DefaultDisplayPropertySet’,[string[]]$defaultDisplaySet)
             $PSStandardMembers = [System.Management.Automation.PSMemberInfo[]]@($defaultDisplayPropertySet)
              
             $schedules = Get-SmaSchedule @smaParameters
             $schedules.ForEach{
               $hash = @{
                 DayInterval=$psitem.DayInterval
                 ScheduleID=$psitem.ScheduleID
                 TenantID=$psitem.TenantID
                 Name=$psitem.Name
                 Description=$psitem.Description
                 StartTime=$psitem.StartTime
                 ExpiryTime=$psitem.ExpiryTime
                 CreationTime=$psitem.CreationTime
                 LastModifiedTime=$psitem.LastModifiedTime
                 IsEnabled=$psitem.IsEnabled
                 NextRun=$psitem.NextRun
                 JobContexts=$psitem.JobContexts
                 Runbooks=$psitem.Runbooks
               }
         
               $psObject = New-Object -TypeName PSObject -Property $hash
               $psObject | Add-Member MemberSet PSStandardMembers $PSStandardMembers
               $psObject
             }
             }

         script Variables{
           $defaultDisplaySet = 'Name','Value','LastModifiedTime'
             $defaultDisplayPropertySet = New-Object System.Management.Automation.PSPropertySet(‘DefaultDisplayPropertySet’,[string[]]$defaultDisplaySet)
             $PSStandardMembers = [System.Management.Automation.PSMemberInfo[]]@($defaultDisplayPropertySet)
              
             $variables= Get-SmaVariable @smaParameters
             $variables.foreach{
             $hash = @{
               VariableId=$psitem.VariableId
               TenantID=$psitem.TenantID
               Name=$psitem.Name
               IsEncrypted=$psitem.IsEncrypted
               CreationTime=$psitem.CreationTime
               LastModifiedTime=$psitem.LastModifiedTime
               Value=$psitem.Value
               Description=$psitem.Description
             }
             $psObject = New-Object -TypeName PSObject -Property $hash
               $psObject | Add-Member MemberSet PSStandardMembers $PSStandardMembers
               $psObject        
           }
         }
         }
       
         script Jobs {
          
         }
         script Runbook {

           $defaultDisplaySet = 'RunbookName','LastModifiedTime'
           $defaultDisplayPropertySet = New-Object System.Management.Automation.PSPropertySet(‘DefaultDisplayPropertySet’,[string[]]$defaultDisplaySet)
           $PSStandardMembers = [System.Management.Automation.PSMemberInfo[]]@($defaultDisplayPropertySet)
              
           $runbooks = Get-SmaRunbook @smaParameters
           ForEach ($Runbook in $Runbooks) {
            <#  Try {
              $DraftContent = Get-SmaRunbookDefinition -Name $Runbook.RunbookName -Type Draft @smaParameters
              $PublishedContent = Get-SmaRunbookDefinition -Name $Runbook.RunbookName -Type Published @smaParameters
              }
              Catch {
              }#>

             $hash = @{
               TenantID=$runbook.TenantID
               RunbookID=$runbook.RunbookID
               RunbookName=$runbook.RunbookName
               CreationTime=$runbook.CreationTime
               LastModifiedTime=$runbook.LastModifiedTime
               LastModifiedBy=$runbook.LastModifiedBy
               Description=$runbook.Description
               IsApiOnly=$runbook.IsApiOnly
               IsGlobal=$runbook.IsGlobal
               PublishedRunbookVersionID=$runbook.PublishedRunbookVersionID
               DraftRunbookVersionID=$runbook.DraftRunbookVersionID
               Tags=$runbook.Tags
               LogDebug=$runbook.LogDebug
               LogVerbose=$runbook.LogVerbose
               LogProgress=$runbook.LogProgress
               Statistics=$runbook.Statistics
               <#DraftRunbookContent=$DraftContent
               PublishedRunbookContent=$PublishedContent#>
               Schedules=$runbook.Schedules
              

             }
         
             $psObject = New-Object -TypeName PSObject -Property $hash
             $psObject | Add-Member MemberSet PSStandardMembers $PSStandardMembers
             $psObject
         
           }
        
         }
       
       }



