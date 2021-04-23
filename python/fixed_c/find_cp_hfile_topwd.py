# cp required h file to $pwd

import subprocess
import re
import shutil

file = "./Python.h"
#file = "./compile.h"
prepath = re.compile(r'^/usr/include/python2.7/')


def find_hfile(hfilename):
    #subp = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, encoding="utf-8")
    #command = ['sudo', 'find', '/', '-name', "'"+hfilename+"'"]    ERROR
    #command = ['find', '/', '-name', "'"+hfilename+"'"]            ERROR
    command = ['find', '/', '-name', hfilename]
    print(command)

    output = subprocess.check_output(command)
    lines = output.split('\n')
    print(lines)
    get_path(lines)
    

def get_path(path_list):
    for tpath in path_list:
        if prepath.search(tpath):
            print("get the path: " + tpath)
            cpto_pwd(tpath)

def cpto_pwd(abshfpath):
    shutil.copy(abshfpath, "./")
    print("copy...ok"  )

    
fd   = open(file, "r")
for tmp in fd.readlines():
    if ".h>" in tmp:
        tmp = tmp.split('<')
        tmp = tmp[1].split('>')
        print(tmp[0])
    elif ".h\"" in tmp:
        tmp = tmp.split('"')
        #print(tmp[1])
        find_hfile(tmp[1])
        #command = "sudo find / -name '" + tmp[1] + "'"
        #subprocess.call(command, shell=True)

