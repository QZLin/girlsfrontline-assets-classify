# Attention! This file require powershell 7
Push-Location $PSScriptRoot

$python_path = "$PSScriptRoot/girlsfrontline-resources-extract"
$extract_prj = "./girlsfrontline-resources-extract"
$acb2wav_py = "acb2wav.py"

$env:Path = $python_path + ';' + $env:Path
python --version
Set-Location $extract_prj
mkdir "$PSScriptRoot/acb.bytes/out" -ErrorAction Ignore
foreach ($file in Get-ChildItem "$PSScriptRoot/acb.bytes/") {
    if ($file -match ".*`.acb`.bytes$") {
        Write-Output "Handle: $file"
        python $acb2wav_py $file -o "$PSScriptRoot/acb.bytes/out"
    }
}

Pop-Location
