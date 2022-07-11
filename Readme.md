# GFL Assets Classify
## Project Structure
* main based on powershell script
* high performance required script write with python and run on pypy
### Generated Files
* MonoBehaviour
    name_map.json path.txt ResData.json ...

## Env Setting Notice
* classify.ps1
  package name
  source path

## Tasks order
1. Pull all files of GFL, use adb or anyway you can.
2. Information Collect: collect_info.ps1
    gen_path.py, gen_name.py, name_map.py
3. classify.ps1
4. Unpack (Recommended [Asset Studio]())

### High Recommended
* rename.ps1
  restore file name according name map