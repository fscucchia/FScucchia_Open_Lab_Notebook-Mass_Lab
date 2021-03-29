---
layout: post
title: Linux Bash Shell Basic Commands  
category: [ Shell Basics ]
tags: [ Hive, Bash, Bioinformatics ]
---

Using the Hive shell for genomic analyses. [Hive](https://hivehpc.haifa.ac.il/) is a high performance computing system of the Faculty of Natural Sciences at University of Haifa. This document is intended to provide helpful commands for the Hive shell. 

In order to connect to the access node of Hive, you need to connect to Hive using SSH protocol. If you work with Windows, download [Bitvise](https://www.bitvise.com/ssh-client) for an easy connection to the server.

If you want to get familiar with Linux and its command line in order to access the full range of bioinformatics tools available to researchers, I strongly recommend to take the free course [Bioinformatics for Biologists: An Introduction to Linux, Bash Scripting, and R](https://www.futurelearn.com/courses/linux-for-bioinformatics). On this course, the educators from the Wellcome Genome Campus (WGC) Advanced Courses and Scientific Conferences are joined by experts from the Institut Pasteur de Tunis, to give practical training using real biological data in different biological scenarios. This will help you see how you can work with data in your own field of biology.

### Basic commands

- `cd`  current directory

- `pwd`  paste working directory

- `ls`  list all the files in the directory

- `cd ..`  go back of one folder

- `clear`  clear the terminal

- `ls -l`  content of the directory in longer form (files names with dates and times)

- `ls -t`  sort files by time

- `ls -ltr`  sort files from the last modified, in the longer form

- `mkdir nameofnewfolder`  create a new folder in the working directory

- `cp nameoffile nameoffolder`  copy file into a folder

- `rm nameoffile`  remove file

- `mv`  move files from one folder to another (like cut/paste)

- `man ls`  show manual with all commands

- `screen -r`  resume screen sessions

- `screen -ls`  lists of active screens

- `bash nameoffile`  run bash script

- `sacct`  check work on hive queue

- `echo $nameofobject`  where is this variable

- `which`  show the location of an object

- `ls *.txt`  list all the txt files in the directory

- `less nameoffile`  show content of file.If you want to look at a very long file then use the less command, as it will display one page at a time. You can then scroll up and down through the file. Use space to advance of one page.

- `head nameoffile`  displays first lines in a file

- `tail nameoffile`  displays last lines in a file

- `cat`  displays the contents of a file

- `sort`  orders a list of items both alphabetically and numerically

- `uniq`  removes any repeated lines, only if they are adjacent to each other

- `grep`  globally search for a regular expression and print matching lines

- `touch` create new, empty file

- `chown`  changes user ownership of a file

- `chgrp`  changes group ownership of a file

- `chmod`  changes the permissions of a file. As an example, `chmod 666 file.txt` will set a file called file.txt to be both readable and writable by the owner. As another example, `chmod g+w file.txt` will make file.txt writeable by anyone with group ownership. 

- `set`  this sets or unsets shell variables. If used without an argument then it will print a list of all variables, both shell and environment, and shell functions.

- `unset`  this deletes shell and environment variables.

- `export`  this command sets environment variables.

To assign a variable, we use the `=` symbol:
- `name="Sam"`

Because variables may contain whitespace which gets interpreted by bash, it’s good practice to wrap the variable name in curly brackets and encase it in double quotes:
- `echo "${name}"`

You can initialise an array by assigning values that are separated by spaces in standard brackets.For example:
- `array=("value 1" "value 2" "value 3")`

Each value in an array is known as an element. Each element in an array is referenced by a numerical index. This index starts at 0.
The syntax to access the first value in our array would be:
- `echo "${array[0]}"`

We can return all of the values in our array by using the `@` symbol:
- `echo "${array[@]}"`

Modern Bash syntax for conditional expressions encases our comparative expression inside double square brackets `([[` and `]])`.
The syntax for this is:
- `[[ option arg1 ]]`
or
- `[[ arg1 operator arg2 ]]`

A conditional expression returns a Boolean value i.e. true or false. If the condition is met, it will return true and if not, false.
Returns true if the file exists:
- `[[ -e ${file} ]]`

Returns true if the file exists and is a directory:
- `[[ -d ${directory} ]]`

Returns true if the file exists and is a regular file:
- `[[ -f ${file} ]]`

Returns true if the file exists and is readable:
- `[[ -r ${file} ]]`

Strings, as sequences of characters, can be compared. There are two string conditional expressions you need to be aware of:
- Is equal to `==`
- Is not equal to `!=`

This condition will return true if string1 and string2 are identical:
- `[[ ${string1} == ${string2} ]]`

This condition will return true if string1 and string2 are different from one another:
- `[[ ${string1} != ${string2} ]]`

**Conditional statements** come in many forms. The most basic form essentially says: **IF** our conditions are met, **THEN** execute the following code.
We can write our if statements in several ways:
```
> if [[ condition ]]
> then
>    	command
> fi
```

Conditional statements can be extended to have another clause by using an **if**..**else** statement. Here we are saying, **IF**  conditions are met, **THEN** execute the following commands. However, **ELSE IF** these conditions are not met, execute a different set of commands.
The syntax for this looks like:
```
> if [[ condition ]]
> then
>    	command1
> else
>    	command2
> fi
```

Use **case** statements to check each condition in turn and process commands based on those conditions. The case syntax looks like this:
```
> case $string in
>    	pattern_1)
>      	command
>     	;;
>    	pattern_2)
>      	alternate command
>      	;;
>    	*)
>      	default command
>      	;;
> esac
```

The basic syntax for a **for loop** is:
```
> for variable in ${list}
> do
>    	# Execute some commands
> done
```

The basic syntax for a **while loop** is:
```
> while [condition]
> do
>    	# Commands to run
> done
```

The basic syntax for a **run-until loop** is:
```
> until [condition]
> do
>    	# Commands to run
> done
```

AWK is a programming language. It is particularly useful for processing text files and extracting data, particularly when a file is split into columns or delimited by a specific character (e.g. a comma).
- `awk -F”\t” '{print $1}' Diamonds_fix.txt`  this will print the value in the first column of the file Diamonds_fix.txt.

- `awk -F”\t” ‘$2==”Ideal” '{print $0}' Diamonds_fix.txt`  this prints only the lines of Diamonds_fix.txt in which column 2 (cut) contains the value “Ideal”.

Patterns can be combined using the && symbol (for and) so a line is printed only if two or more conditions are met. For example:
- `awk -F”\t” ‘$2==”Ideal” && $4==”SI2”’ Diamonds_fix.txt`

In addition to strings, awk can also filter on numeric values. For example:
- `awk -F”\t” ‘$1>1’ Diamonds_fix.txt`  this will print all lines in which the first column has a value greater than 1. 

How to run **R** in Hive:
- `conda activate R_setting6`

followed by
- `srun --pty -p hiveunlim,hive7d,hive1d R`

Shared softwares in Hive are located in /data/apps and working with the help of module utility LMOD (which allows to load and unload needed software and versions of software), you can read about module [here](https://lmod.readthedocs.io/en/latest/010_user.html).

Use command `module avail` to see what software is installed already in public place.


