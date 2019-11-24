---
geometry: margin=1in
header-includes: \usepackage[os=win]{menukeys}
---

# Introduction to "R" -- Cheat Sheet

## Basics

- Unqouted text is treated as name of an object (`thisisanobject`, `"this is just text"`)
- Use the assignment operator to save results of calculations or outputs of functions to an object: (e.g. `result  <- 2+4` or `nrs <- rnorm(100)`)
- `R` is case sensitive (`object` ist not the same as `Object`) 
- put quotation marks around text, which is not to be treated as an object name (`'single'` or `"double"`)
- round parentheses `()` immediately follow a function name (e.g. `rnorm(2)`)
    + inputs are assigned to arguments based on names or order (e.g. `norm(10, 2, 3)` does the same as `norm(n = 10, mean = 2, sd = 3)`)
- square parentheses `[]` immediately follow a vector, matrix or data.frame
    + when subsetting rectangular objects like data.frames you always need to put a comma (e.g. `df[, 'varname']`)
- for every opening bracket there must be a closing bracket

## Keyboard shortcuts

- Assignment operator: \keys{\Alt + -}
- Piping operator: \keys{\ctrl + \shift + M}
- Autocomplete (in console and editor): \keys{\tab}
- Run code in script: \keys{\ctrl + \return}
- Run code in console: \keys{\return}
- Comment and uncomment (in editor): \keys{\ctrl + \shift + C}
- Toggle through executed code (in console): (\keys{\ctrl} +) \keys{\arrowkeyup} and \keys{\arrowkeydown}
- Clear screen (in console): \keys{\ctrl + L}
- Switch to source: \keys{\ctrl + 1} 
- Switch to console: \keys{\ctrl + 2}
- Keyboard Shortcut Help: \keys{\shift + \Alt + K}

## Working with the computer's folder structure

- use `setwd()` to set the working directory
	- 'directory' is just another word for 'folder'
	- this is the 'place' on your computer where `R` will look for files to open them or to save files
- Use `/` (not `\` to separate folder and file names, even on Windows)
   
```
- r_workshop
  |
  +- data
     +- BundestagForecastReplicationData.csv
     + ...
  +- exercise
  +- ...
```  

The following sets the working directory and loads the file `BundestagForecastReplicationData.csv` from the subfolder called `data` contained within the folder `r_workshop` as illustrated above. `r_workshop` is located in the home directory of a user 'Andrea' on Windows 10:

```
setwd('C:/Users/Andrea/r_workshop')

df <- read.csv('data/BundestagForecastReplicationData.csv', stringsAsFactors = F)
```