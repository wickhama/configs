#!/usr/bin/python
import os
def link(target, destination):
    os.system('ln -f '+target+' '+destination)

def insert(target, destination):
    print("contains mode is not yet implemented because I'm lazy")

def handle_config(line):
    if line[0] == '#':
        return
    line = line.split()
    if line[2] == 'o':
        link(line[0], line[1])
    elif line[2] == 'c':
        insert(line[0], line[1])

with open('targets') as f:
    for line in f:
        handle_config(line)
