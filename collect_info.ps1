. .\venv\Scripts\Activate.ps1
python name_map.py -i MonoBehaviour\ResData.json -o MonoBehaviour\name_map.json
python gen_path.py -i .\MonoBehaviour\ResData.json -o .\MonoBehaviour\path.txt