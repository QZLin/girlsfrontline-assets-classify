import re
import time
import argparse
import json

parser = argparse.ArgumentParser()
parser.add_argument('-i','--input',help='input file', default='ResData.json')
parser.add_argument('-o','--output',help='output file', default='path.txt')
parser.add_argument('-s','--stdout',help='output to stdout', action='store_true')
args = parser.parse_args()

t = time.time()

with open(args.input,'r') as f:
    s = f.read()

r = re.findall(r'"pathKey"\s*:\s*"(.*)"',s)
r.sort()

if not args.stdout:
    with open(args.output,'w') as f:
        f.write("\n".join(r))
        print(f"TotalTime: {round(time.time()-t,3)}s")

else:
    print("\n".join(r))

