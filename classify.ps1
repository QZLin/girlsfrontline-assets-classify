#Requires -Version 7.0
$PackageName = "com.sunborn.girlsfrontline.cn"
$SourceLocation = "$PSScriptRoot/source/$PackageName/files/Android/New"
Push-Location $SourceLocation

function mkdir_ {
    param ([Parameter(Mandatory = $true, ValueFromPipeline = $true)]$location)
    if (Test-Path $location) {
        $object = Get-Item $location
        if ( $object -is [System.IO.DirectoryInfo] ) {}
        else {
            Write-Error "File already exist: $location"
            Exit 1
        }  
    }
    else {
        New-Item -ItemType Directory $location -Force
    }
    $object
}


### classify by file type
mkdir_ "ab"
mkdir_ "acb.bytes"
mkdir_ "usm.bytes"
Move-Item "*.ab" "ab"
Move-Item "*.acb.bytes" "acb.bytes"
Move-Item "*.usm.bytes" "usm.bytes"

### ab
Push-Location "ab"
$classify = "character", "live2d", "asset", "resource", "atlasclips", "sprite"
$classify | ForEach-Object { mkdir_ $_ }
foreach ($class in $classify) {
    Get-ChildItem | Where-Object { $_ -match "$class.*\.ab$" } | Move-Item -Destination $class
}
Pop-Location

### ab/asset
Push-Location "ab/asset"
$classify = "assetparticle", "assetmapchapter", "assetmapo", "avg"
$classify | ForEach-Object { mkdir_ $_ }
foreach ($class in $classify) {
    Get-ChildItem | Where-Object { $_ -match "$class.*\.ab$" } | Move-Item -Destination $class
}
Pop-Location

### acb.bytes
Push-Location "acb.bytes"
## generate characters list
# Run structure_info.py to generate path.txt:
# structure_info.py -i .\MonoBehaviour\ResData.json -o .\MonoBehaviour\path.txt
$name_list = python "$PSScriptRoot/char_list.py" -i "$PSScriptRoot/MonoBehaviour/path.txt" -s
mkdir_ "char" 
foreach ($name in $name_list) {
    Get-ChildItem | Where-Object { $_.Name -match "^$name[_(Live2D)(buhuo)(\d)]*\.acb\.bytes$" } | Move-Item -Destination "char"
}
Pop-Location

Pop-Location
