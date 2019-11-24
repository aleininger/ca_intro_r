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
library(dplyr)

# 3. Convert the data using as_tibble()
f <- as_tibble(hflights)

# 4. Print the data.frame to the console. What do you notice?
f

# 5. Print the first 25 rows of the data.frame using print(, n = ).
print(f, n=25)

# 6. Show all flights on 1 April
unique(f$Month)
f %>% filter(DayofMonth == 1, Month == 4)

f %>% filter(DayofMonth == 1 & Month == 1)  # is equivalent

# 7. Show all flights by carriers American Airlines (AA) and Continental
# Airlines (CO).
f %>% filter(UniqueCarrier == 'AA' | UniqueCarrier == 'CO')

f %>% filter(UniqueCarrier %in% c('AA', 'CO'))

# 8. Show departure and arrival times for flights to Los Angeles (LAX).
f %>% filter(Dest == 'LAX') %>% select(DepTime, ArrTime)

# 9. Sort flights by departure delay.
f %>% arrange(DepDelay)

# 10. Which flight covers the shortest distance? Which covers the longest? Print
# only the longest and shortest flight.
f %>% filter(Distance == min(Distance) | Distance == max(Distance))

# 11. Create a variable which indicates the average flight speed (mph).
f %>% mutate(Speed = Distance / (AirTime / 60)) %>%
  select(Distance, AirTime, Speed)

# 12. Provide information on average overall delay (departure + arrival) by
# destination.
f %>% group_by(Dest) %>% mutate(Delay = DepDelay + ArrDelay) %>%
  summarise(MeanDelay = mean(Delay, na.rm = TRUE))

# 13. Calculate the percentage of flights cancelled by carrier
f %>% group_by(UniqueCarrier) %>% summarise(Cancelled = mean(Cancelled) * 100)

# 14. Which is the most frequent destination for flights from Houston?
# Use the helper function n() to find out.
f %>% group_by(Dest) %>% summarise(n_flights = n()) %>%
  filter(n_flights == max(n_flights))