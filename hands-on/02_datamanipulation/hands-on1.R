# Introduction to "R"
# Data manipulation
#
# Hands-on 1

# 1 We will use data on flights from Houston airport. This dataset is stored in
# the file hflights.RData. We will load the data with load() (Which is for
# *.RData) which loads the data from the file and assigns it to an object called
# hfights in R's memory. To learn more about load() use ?load and for
# corresponding save() ?save.

setwd('put path to the r_workshop folder on your machine here.')

load('data/hflights.RData')

# 2. Get an overview of the data. What is a single observation? How many
# observations are there? How many variables? What type?

# 3. Reduce the set of flights to flights to Los Angeles (LAX).

# 4. How many flights were cancelled?

# 5. Create a dummy variable indicating flights on weekends.

# 6. Which airline carries out to the most flights on weekends? Use the function
# table() to get a frequency count of the variable UniqueCarrier. Remember to
# subset the data first.

# 7. Replace the unique carrier abbreviations with the full names of the companies
# and save the names in a new variable.
# WN = Southwest Airlines, MQ = Envoy Air, CO = Continental Airlines

# 8. If you're feeling adventurous, sort the data by total taxiing time. Check
# out the function sort().