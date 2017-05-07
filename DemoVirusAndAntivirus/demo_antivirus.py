#!/usr/bin/python
import os

SIGNATURELIST=["SAMPLE PYTHON VIRUS"]

def search(path):
    virusFiles = []
    filelist = os.listdir(path)
    for fname in filelist:
        if os.path.isdir(path+"/"+fname):
            virusFiles.extend(search(path+"/"+fname))
        elif fname=="demo_antivirus.py":
            continue
        else:
            for line in open(path+"/"+fname):
                for SIGNATURE in SIGNATURELIST:
                    if SIGNATURE in line:
                        virusFiles.append(path+"/"+fname)
    return virusFiles

def removeVirus(virusFiles):
    for fname in virusFiles:
        os.remove(fname)

virusFiles = search(os.path.abspath(""))
for fname in virusFiles:
    print fname

choice = raw_input("Do you want to delete the infected files? (Y/n) ")
if choice == 'Y':
    removeVirus(virusFiles)

