# Attention! This file require powershell 7
Set-Location $PSScriptRoot
$root = Get-Location


### classify by file type
mkdir "ab"  -ErrorAction Ignore
mkdir "acb.bytes"  -ErrorAction Ignore
mkdir "usm.bytes"  -ErrorAction Ignore
Move-Item "*.ab" "ab"
Move-Item "*.acb.bytes" "acb.bytes"
Move-Item "*.usm.bytes" "usm.bytes"

### ab
Set-Location "ab"
$classify = "character", "live2d", "asset", "resource", "atlasclips", "sprite"
foreach ($name in $classify) {
    mkdir $name -ErrorAction Ignore
}
foreach ($file in Get-ChildItem) {
    foreach ($name in $classify) {
        if ($file -match "$name.*\.ab$") {
            Move-Item $file $name
        }
    }
}
Set-Location $root

### ab/asset
Set-Location "ab/asset"
$classify = "assetparticle", "assetmapchapter", "assetmapo", "avg"
foreach ($name in $classify) {
    mkdir $name -ErrorAction Ignore
}
foreach ($file in Get-ChildItem) {
    foreach ($name in $classify) {
        if ($file -match "$name.*\.ab$") {
            Move-Item $file $name
        }
    }
}
Set-Location $root

### acb.bytes
## generate characters list
Set-Location "MonoBehaviour"
$classify = ../pyfiles/gen-charlist-resdata.py
$classify = $classify -split ","
Set-Location $root
## classify
Set-Location "acb.bytes"
mkdir "char"  -ErrorAction Ignore
foreach ($file in Get-ChildItem) {
    foreach ($name in $classify) {
        if ($file.Name -match "^$name[_(Live2D)(buhuo)(\d)]*\.acb\.bytes$") {
            Move-Item $file "char"
        }
    }
}
Set-Location $root
