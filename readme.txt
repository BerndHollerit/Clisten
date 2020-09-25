ARAM 2nd Release HOW-TO

1 INSTALLATION
2 START
3 HELP
4 TROUBLESHOOTING

1 INSTALLATION
--------------
1. Unpack Team004SecondRelease.zip archive in root (c:\) on your hard-drive 
2. RubyCLR requires setting the RUBY_LIB environment variable. You must run
setup.cmd in the directory c:\clisten\RubyCLR to correctly setup this
environment variable. 
3. Restart the computer

2 START
-------
Execute 
ruby c:\clisten\GUIHomeScreen.rb

3 HELP
------
For any questions or assistance contact ARAM support on 0800-ARAM or visit our stand

4 TROUBLESHOOTING
-----------------
--> I have problems with paths. What to do?
Error occurs if other path is used and archive is not unzipped in c:\
Check and if neccessary change the paths in GUIHomeScreen.rb
* address variable - (your path)\index-hauptseite.html (i.e. D:\somefolder\index-hauptseite.html)
* backgroundImage variable - (your path)\background_p900.bmp (i.e. D:\somefolder\background_p900.bmp)
Do the same procedure for TC_ files.