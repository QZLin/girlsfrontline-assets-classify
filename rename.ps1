Push-Location $PSScriptRoot

$data = Get-Content "$PSScriptRoot/MonoBehaviour/name_map.json" | ConvertFrom-Json
Push-Location .\source
Get-ChildItem -Recurse -Filter "*.ab" | ForEach-Object {
    $name = $data."$($_.BaseName)"
    if ($name) {
        Write-Output "$name.ab << $($_.Name)"
        Rename-Item -Path $_ -NewName "$name.ab"
    }
}
Pop-Location

Pop-Location