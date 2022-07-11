import re
import time
import argparse
import json

parser = argparse.ArgumentParser()
parser.add_argument('-i','--input',help='input file', default='ResData.json')
parser.add_argument('-o','--output',help='output file', default='name_map.json')
parser.add_argument('-s','--stdout',help='output to stdout', action='store_true')
args = parser.parse_args()

with open(args.input,'r') as f:
    data = json.load(f)
    map = {x['resname']:x['assetBundleName'] for x in data['passivityAssetBundles']}
    map.update({x['resname']:x['assetBundleName'] for x in data['BaseAssetBundles']})
    map.update({x['resname']:x['assetBundleName'] for x in data['AddAssetBundles']})

if not args.stdout:
    with open(args.output,'w') as f:
        json.dump(map,f)
else:
    print(json.dumps(map))