
$date = get-date
$datestamp = $date.ToString("yyyyMMddhhmmss")

$filename = "HRGRP_REPORT_" + $datestamp + ".xlsx"

$results_groups = @()
$results = @{}

$results_groups += 'HRGRP_GROUPS'

$groups = get-adgroup -filter {name -like "HRGRP_*"}

foreach ($group in $groups) {
    $group_name    = get-adgroup $group | select-object name
    $group_members = get-adgroupmember -Identity $group -recursive

    $group_members_clean = @()

    foreach ($group_member in $group_members) {
        $user    = $group_member | get-aduser -properties * | select-object samaccountname,sn,givenname,mail,telephonenumber,title,department,employeenumber,employeetype,manager
        $group_members_clean += $user
    }

    $results.add($group_name, $group_members_clean)
    $results_groups += $group_name.name
}

$results_groups | export-excel -path ./$filename -AutoSize -AutoFilter -FreezeTopRow -BoldTopRow -ClearSheet -WorksheetName HRGRP_LIST

foreach ($result in $results.keys) {
    $results.$result | export-excel -path ./$filename -AutoSize -AutoFilter -FreezeTopRow -BoldTopRow -ClearSheet -WorksheetName $result.name.substring(0, [system.math]::min(31, $result.name.length))
}
