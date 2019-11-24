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

head(hflights)

dim(hflights)

str(hflights)

# 3. Reduce the set of flights to flights to Los Angeles (LAX).
lax <- subset(hflights, Dest == 'LAX')

sub <- hflights[which(hflights$Dest == 'LAX')]

# 4. How many flights were cancelled?
sum(hflights$Cancelled)

# 5. Create a dummy variable indicating flights on weekends.
unique(hflights$DayOfWeek)
hflights$weekend <- hflights$DayOfWeek > 5

# 6. Which airline carries out to the most flights on weekends? Use the function
# table() to get a frequency count of the variable UniqueCarrier. Remember to
# subset the data first.
table(hflights$UniqueCarrier[which(hflights$weekend == T)])

sort(table(hflights$UniqueCarrier[which(hflights$weekend == T)]))

# 7. Work with the data on flights to LAX only.
# Replace the unique carrier abbreviations with the full names of the companies
# and save the names in a new variable.
# WN = Southwest Airlines, MQ = Envoy Air, CO = Continental Airlines

hflights$Carrier[which(hflights$UniqueCarrier == 'WN')] <-
  'Southwest Airlines'
hflights$Carrier[which(hflights$UniqueCarrier == 'MQ')] <-
  'Envoy Air'
hflights$Carrier[which(hflights$UniqueCarrier == 'CO')] <-
  'Continental Airlines'

# or simpler but trickier
translate <- c('Southwest Airlines', 'Envoy Air', 'Continental Airlines')
names(translate) <- c('WN', 'MQ', 'CO')
translate

hflights$Carrier <- translate[hflights$UniqueCarrier]
hflights$Carrier

# 8. If you're feeling adventurous, sort the data by total taxiing time. Check
# out the function sort().
hflights <- hflights[order(hflights$TaxiIn + hflights$TaxiOut), ]

head(hflights)