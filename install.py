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
    target = line[0]
    destination = line[1]
    #ask the user if they would like to use the position provided in the targets file or a custom location
    if line[2] == 'o':
        link(target, destination)
    elif line[2] == 'c':
        insert(target, destination)

with open('targets') as f:
    for line in f:
        handle_config(line)
