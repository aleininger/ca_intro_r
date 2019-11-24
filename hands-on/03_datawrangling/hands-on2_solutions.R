# Introduction to "R"
# Data wrangling
#
# Hands-on 2

setwd('')

# 1. Load the dplyr and tidyr packages or load tidyverse which will load both
# as well as further packages. Remember, it's library().

# 2. Read the file 'aggregate.csv' and save it to a 'tibble' (as_tibble()).
# Don't forget to set the working directory beforehand.
a <- read.csv('data/aggregate.csv', stringsAsFactors = F) %>% as_tibble()

# 3. Read the file 'referendums.csv' and save it to another 'tibble'
# (use the fucntion as_tibble() for this).
r <- read.csv('data/referendums.csv', stringsAsFactors = F) %>% as_tibble()

# 4. Figure out what the units of observation in the two datasets are whtether
# the two are compatible.
a

r

unique(a$nation) %in% unique(r$country)

range(a$time)
range(r$time)

# 5. Merge the two files, keeping all observations from 'aggregate.csv' but do
# not merge observations from 'referendums.csv' without match in 'aggregate.csv.'
# Note that both datasets contain data for multiple countries observed semi-
# annually
m <- left_join(a, r, by = c('nation' = 'country', 'time'))

# 6. Read the file 'fearofcrime_borough.csv' and save it to a tibble. This
# is a single spreadsheet from this file: https://files.datapress.com/london/dataset/metropolitan-police-service-recorded-crime-figures-and-associated-data/2015-12-23T15:58:16/MASTER_mps-figures.xls
foc <- read.csv('data/fearofcrime_borough.csv', stringsAsFactors = F) %>% as_tibble()

# 6. The data report the fraction of citizens worried about crime in a borough
# at a given time. It's in wide format, turn it into long or so-called "tidy"
# format using gather() from the package tidyr.
foc

glimpse(foc)

library(tidyr)

foc_tidy <- foc %>% gather(key = 'Borough', value = 'foc',
                           Barking.and.Dagenham:Westminster)

# 7. The data is still not ready to be analyzed.
# What's wrong about this dataset? Hint: check the values of the variable foc.
# And adjust the coding.
range(foc_tidy$foc)
sort(unique(foc_tidy$foc))

foc_tidy$foc[which(foc_tidy$foc > 1)] <-
    foc_tidy$foc[which(foc_tidy$foc > 1)] / 100