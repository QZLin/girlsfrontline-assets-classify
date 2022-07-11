import re
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-i','--input',help='input file', default='path.txt')
parser.add_argument('-o','--output',help='output file', default='char_list.txt')
parser.add_argument('-s','--stdout',help='output to stdout', action='store_true')
args = parser.parse_args()

with open(args.input,'r') as f:
    s = f.read()

lines = [x for x in s.split('\n') if x.startswith('Assets/Characters/')]
chars = []
for x in lines:
    r = re.match(r'Assets/Characters/(.*?)[_/]',x)
    if r is None:
        continue
    char = r.groups()[0]
    if char not in chars:
        chars.append(char)

if args.stdout:
    print('\n'.join(chars))
else:
    with open(args.output,'w'):
        f.write('\n'.join(chars))