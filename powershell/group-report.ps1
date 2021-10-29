
$date = get-date
$datestamp = $date.ToString("yyyyMMddhhmmss")

$filename = "GROUP_REPORT_" + $datestamp + ".xlsx"

$results_groups = @()
$results = @{}

$results_groups += 'GROUPS'

$groups = get-adgroup -filter {name -like "Confluence_CYB_*"}

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

$results_groups | export-excel -path ./$filename -AutoSize -AutoFilter -FreezeTopRow -BoldTopRow -ClearSheet -WorksheetName GROUP_LIST

foreach ($result in $results.keys) {
    $results.$result | export-excel -path ./$filename -AutoSize -AutoFilter -FreezeTopRow -BoldTopRow -ClearSheet -WorksheetName $result.name.substring(0, [system.math]::min(31, $result.name.length))
}
