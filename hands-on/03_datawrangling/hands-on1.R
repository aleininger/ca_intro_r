# Introduction to "R"
# Data wrangling
#
# Hands-on 1

# 1 We will use data on flights from Houston airport again. This dataset is stored
# in the file hflights.RData. We will load the data with load() (Which is for
# *.RData) which loads the data from the file and assigns it to an object called
# hfights in R's memory. To learn more about load() use ?load and for
# corresponding save() ?save.

setwd('put path to the r_workshop folder on your machine here.')

load('data/hflights.RData')

# 2. Load the dplyr package.

# 3. Convert the data using as_tibble().

# 4. Print the data.frame to the console. What do you notice?

# 5. Print the first 25 rows of the data.frame using print(, n = ).

# 6. Show all flights on 1 April

# 7. Show all flights by carriers American Airlines (AA) and Continental
# Airlines (CO).

# 8. Show departure and arrival times for flights to Los Angeles (LAX).

# 9. Sort flights by departure delay.

# 10. Which flight covers the shortest distance? Which covers the longest? Print
# only the longest and shortest flight.

# 11. Create a variable which indicates the average flight speed (mph).

# 12. Provide information on average overall delay (departure + arrival) by
# destination.

# 13. Calculate the percentage of flights cancelled by carrier

# 14. Which is the most frequent destination for flights from Houston?
# Use the helper function n() to find out.