#!/usr/bin/env python3
# pdftk in.pdf cat $(booklet.py 32)  output out.pdf

import sys

N=int(sys.argv[1])

x=[]

p=0
while p < int(N/2):
    x = x + [N-p, p+1, N-p-2, p+3]
    p = p + 2
    x = x + [p, N-p+1, p+2, N-p-1]
    p = p + 2


print(' '.join(map(str, x)))
