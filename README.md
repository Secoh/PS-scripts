# PowerShell Scripts

TStomp<br>
(Windows 10)<br>
Very simple script to destroy windows timestamp (creation, write, and access times), recursively from a given location.<br>
Long story short, windows timestamp represents an evidence of what happened when. Leaving traces may be unwanted in certain circumstances. There are many tools to alter filesystem timestamps; however, many have problems. Standard touch command (GNU WIN, for example) will not overwrite creation time. Closed-source binaries, while <i>probably</i> doing their functions, who knows what else they are doing. Btw, this is common problem with hacker's tools which you don't completely understand. The main benefit of my version is the open source code for you to examine before you can use it.<br>
P.S. Unfortunately, "timestomp" is already taken. It is doing approximately the same, except it is closed-source.

TCheck<br>
(Windows 10)<br>
Lists all files recursively from the current directory, that were created or modified during work hours (Monday to Friday, 9am to 5pm).

FStomp<br>
(Windows 10)<br>
<b>DANGER! DANGER! DANGER!</b> Risk of permanent damage to your data!<br>
Very simple wrapper script for FSTOMP.EXE (file-stomp), utility to destroy the file content.<br>
It is well-known that deleting a file, and even clearing the trash bin, doesn't destroy the information.
This project attempts to write garbled data in place of the existing data of the file(s), starting from the current directory.

Custom VID/PID for USB-to-Serial converter(s)<br>
(Windows 10)<br>
to be written...
