# cp required h file to $pwd

import sys
import os

file = "Python.h"

fd = open(file, "r")
for tmp in fd.readline(): 
  if ".h>" in tmp or ".h\"" in tmp:
     print(tmp)
     
    
