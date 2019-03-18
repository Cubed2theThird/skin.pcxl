import subprocess
import xbmc
import sys
import os
import xbmcgui

exists = os.path.isfile('C:/Program Files/Vivaldi/Application/vivaldi.exe')
exists2 = os.path.isfile('C:/Program Files (x86)/Vivaldi/Application/vivaldi.exe')

if exists:

	xbmc.executebuiltin('PlayerControl(Stop)')
	xbmc.executebuiltin('Minimize')

	args = ['C:/Program Files/Vivaldi/Application/vivaldi.exe', '--app=https://www.xfinity.com/stream/']
	subprocess.call(args)
	
	xbmc.executebuiltin('Skin.SetString(snapwindow, RunScript(special://skin/scripts/xfinity.py))')
	xbmc.executebuiltin('Skin.SetString(snapico, home/snap/xfinity.jpg)')
	xbmc.executebuiltin('Skin.SetString(snapname, Xfinity TV)')
	xbmc.executebuiltin('Quit')

elif exists2:

	xbmc.executebuiltin('PlayerControl(Stop)')
	xbmc.executebuiltin('Minimize')

	args = ['C:/Program Files (x86)/Vivaldi/Application/vivaldi.exe', '--app=https://www.xfinity.com/stream/']
	subprocess.call(args)
	
	xbmc.executebuiltin('Skin.SetString(snapwindow, RunScript(special://skin/scripts/xfinity.py))')
	xbmc.executebuiltin('Skin.SetString(snapico, home/snap/xfinity.jpg)')
	xbmc.executebuiltin('Skin.SetString(snapname, Xfinity TV)')
	xbmc.executebuiltin('Quit')

else:

	xbmcgui.Dialog().ok("Xfinity TV", "The App Is Currently Unavaible")