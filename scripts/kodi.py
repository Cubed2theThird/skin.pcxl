import sys
import os
import xbmcgui

xbmcgui.Dialog().ok("Warning", "The only way to close kodi is to restart your computer or close the bat file")
xbmcgui.Dialog().ok("Closing", "Kodi will restart on its own")
os.system("kodi.bat")