# Lab Report 3
I found all commands using the `man find` terminal command.

## -type

**Command 1**
    
This command outputs all files that are of the directory type, which is useful if you want to search only for directories amongst a lot of different file types.
```
find . -type d
```

**Output 1** 
```
.
./non-fiction
./non-fiction/OUP
./non-fiction/OUP/Berk
./non-fiction/OUP/Abernathy
./non-fiction/OUP/Rybczynski
./non-fiction/OUP/Kauffman
./non-fiction/OUP/Fletcher
./non-fiction/OUP/Castro
./travel_guides
./travel_guides/berlitz1
./travel_guides/berlitz2
```

**Command 2** 

This command outputs all files that are of the regular file type, which is useful if you want to search only for regular files and ignore other file types (regular files seem to be any file that's not a block special, character special, directory, regular file, symbolic link, FIFO or socket). I only listed the top few lines of the output since a lot of files were listed.

```
find . -type f
```

**Output 2** 

```
./non-fiction/OUP/Berk/ch2.txt
./non-fiction/OUP/Berk/ch1.txt
./non-fiction/OUP/Berk/CH4.txt
./non-fiction/OUP/Berk/ch7.txt
./non-fiction/OUP/Abernathy/ch2.txt
./non-fiction/OUP/Abernathy/ch3.txt
./non-fiction/OUP/Abernathy/ch1.txt
./non-fiction/OUP/Abernathy/ch7.txt
./non-fiction/OUP/Abernathy/ch6.txt
./non-fiction/OUP/Abernathy/ch8.txt
./non-fiction/OUP/Abernathy/ch9.txt
```

## -size 

**Command 3** 

This command outputs all files that are greater than 150 kilobytes. This is useful to find large files that may be taking up too much space.

```
find . -size +150k
```

**Output 3**
```
./travel_guides/berlitz1/WhereToIndia.txt
./travel_guides/berlitz1/WhereToMalaysia.txt
./travel_guides/berlitz1/WhereToJapan.txt
./travel_guides/berlitz2/China-WhereToGo.txt
```

**Command 4**

This command outputs all files that are greater than 50 kilobytes but less than 60 bytes. This is useful to find files in a certain size range since a minimum and maximum size can be specified.
```
find . -size -60k -size +50k 
```

**Output 4** 
```
./non-fiction/OUP/Abernathy/ch8.txt
./non-fiction/OUP/Rybczynski/ch3.txt
./non-fiction/OUP/Fletcher/ch2.txt
./non-fiction/OUP/Fletcher/ch9.txt
./non-fiction/OUP/Castro/chM.txt
./travel_guides/berlitz1/HistoryIndia.txt
./travel_guides/berlitz2/Amsterdam-WhereToGo.txt
./travel_guides/berlitz2/Nepal-WhereToGo.txt
./travel_guides/berlitz2/Bermuda-WhereToGo.txt
./travel_guides/berlitz2/Vallarta-WhereToGo.txt
```

## -maxdepth 

**Command 5** 

This command finds all files that are within at most two subdirectories. This is useful to find files within a directory with many levels of subdirectories and prevent the terminal from descending into too many directories.

```
find . -maxdepth 2
```

**Output 5**
```
.
./non-fiction
./non-fiction/OUP
./travel_guides
./travel_guides/berlitz1
./travel_guides/berlitz2
```

**Command 6** 

This command finds only the files in the current subdirectory. This is again useful when a directory has many levels of subdirectories and allows the user to see a cleaner output.

```
find . -maxdepth 1
```

**Output 6**
```
.
./non-fiction
./travel_guides
```


## -delete

**Command 7** 

This command removes all files whose name includes "ToHawaii". This is useful because it combines the `find` and `rm` command into one line and allows fast deletion of the specified files.

```
find . -name "*ToHawaii*" -delete
```
**Output 7**

There is no output since the files are deleted. However, before this command was run, `find . -name "*Hawaii*"` showed
```
./travel_guides/berlitz1/WhatToHawaii.txt
./travel_guides/berlitz1/HistoryHawaii.txt
./travel_guides/berlitz1/WhereToHawaii.txt
./travel_guides/berlitz1/HandRHawaii.txt
```
Now after the command is ran, `find . -name "*Hawaii*"` shows 
```
./travel_guides/berlitz1/HistoryHawaii.txt
./travel_guides/berlitz1/HandRHawaii.txt
```

**Command 8** 

This command removes all files that are greater than 200 kilobyte. This is useful to remove large files in a directory. 
```
find . -size +200k -delete
```

**Output 8**

There is no output after the command was ran. However, before this command was run, `find . -size +200k` showed
```
./travel_guides/berlitz1/WhereToItaly.txt
./travel_guides/berlitz1/WhereToFrance.txt
./travel_guides/berlitz2/Canada-WhereToGo.txt
```

After this command is ran, `find . -size +200k` shows no output because the files with sizes greater than 200 kilobytes were deleted.
