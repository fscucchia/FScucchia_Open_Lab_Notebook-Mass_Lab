---
layout: post
title: Linux Bash Shell Basic Commands  
category: [ Shell Basics ]
tags: [ Hive, Bash, Bioinformatics ]
---

Using the Hive shell for genomic analyses. [Hive](https://hivehpc.haifa.ac.il/) is a high performance computing system of the Faculty of Natural Sciences at University of Haifa. This document is intended to provide helpful commands for the Hive shell. 

**Basic commands**

*cd* #current directory

*pwd* #paste working directory

*ls* #list all the files in the directory

*cd ..* #go back of one folder

*clear* #clear the terminal

*ls -l* #content of the directory in longer form (files names with dates and times)

*ls -t* #sort files by time

*ls -ltr* #sort files from the last modified, in the longer form

*mkdir nameofnewfolder* #create a new folder in the working directory

*cp nameoffile nameoffolder* #copy file into a folder

*rm nameoffile* #remove file

*mv* #move files from one folder to another (like cut/paste)

*man ls* #show manual with all commands

*screen -r* #resume screen sessions

*screen -ls* #lists of active screens

*bash* #send command to hive

*sacct* #check work on hive queue

*echo $nameofobject* #where is this variable

*which* #show the location of an object

ls *.txt #list all the txt files in the directory

*less nameoffile* #show content of file.If you want to look at a very long file then use the less command, as it will display one page at a time. You can then scroll up and down through the file. Use space to advance of one page.

*head nameoffile* #displays first lines in a file

*tail nameoffile* #displays last lines in a file

*cat* #displays the contents of a file

#three commands used to change ownership and permissions of files
*chown* #changes user ownership of a file.
*chgrp* #changes group ownership of a file.
*chmod* #changes the permissions of a file. As an example, chmod 666 file.txt will set a file called file.txt to be both readable and writable by the owner.
      #As an example, chmod g+w file.txt will make file.txt writeable by anyone with group ownership. 


#Run R in Hive
*conda activate R_setting6*
*srun --pty -p hiveunlim,hive7d,hive1d R*

