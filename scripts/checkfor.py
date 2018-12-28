import os
import sys
import xbmc

from sys import platform
if platform == "linux" or platform == "linux2":
    # linux
	exists = os.path.isfile('/usr/bin/emulationstation')
elif platform == "win32":
    # Windows 32bit
	exists = os.path.isfile('C:/Program Files/EmulationStation/ emulationstation.exe')
elif platform == "win64":
    # Windows 64bit
	exists = os.path.isfile('C:/Program Files (x86)/EmulationStation/emulationstation.exe')