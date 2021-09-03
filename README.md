# camping_research
Sav's camping Rscript and files

### Usage

Place .csv files in the same directory as this script.

If using Rstudio, use the setwd at the top of the file to set the location of this directory. 
This can be found in the terminal by navigating to directory with this script and .csv files,
and typing:
```
pwd
```
Then pasting the output of that command into the string in setwd()

If running from terminal, type:
```
Rscript combine.R
```

Both ways will generate a combined .csv file for future use, called \"combined.csv\".
