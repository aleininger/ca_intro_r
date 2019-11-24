# Introduction to "R"
# Data wrangling
#
# Hands-on 2

# 1. Load the dplyr and tidyr packages or load tidyverse which will load both
# as well as further packages. Remember, it's library().

# 2. Read the file 'aggregate.csv' and save it to a 'tibble' (as_tibble()).
# Don't forget to set the working directory beforehand.

# 3. Read the file 'referendums.csv' and save it to another 'tibble'
# (use the fucntion as_tibble() for this).

# 4. Merge the two files, keeping all observations from 'aggregate.csv' but do
# not merge observations from 'referendums.csv' without match in 'aggregate.csv.'
# Note that both datasets contain data for multiple countries observed semi-
# annually

# 5. Read the file 'fearofcrime_borough.csv' and save it to a tibble. This
# is a single spreadsheet from this file: https://files.datapress.com/london/dataset/metropolitan-police-service-recorded-crime-figures-and-associated-data/2015-12-23T15:58:16/MASTER_mps-figures.xls

# 6. The data report the fraction of citizens worried about crime in a borough
# at a given time. It's in wide format, turn it into long or so-called "tidy"
# format using gather() from the package tidyr.

# 7. The data is still not ready to be analyzed.
# What's wrong about this dataset? Hint: check the values of the variable foc.
# And adjust the coding.