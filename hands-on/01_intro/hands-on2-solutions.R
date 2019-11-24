# Introduction to "R"
# Introduction to R and RStudio
#
# Hands-on 2

# 1 Set your working directory to the workshop folder which you downloaded.
setwd('path to your directory here')

# 2 Open the file BundestagForecastReplicationData.csv and assign its content to
# an object.
d <- read.csv('data/BundestagForecastReplicationData.csv', stringsAsFactors = F)

# 3 How many observations are in the dataset?
nrow(d)

# 4 How many variables does the dataset contain?
ncol(d)

# 5 Create a variable of type logical which is TRUE for each election after 1990
# and FALSE for all others. Simply checke whether year is greater or equal to
# 1990 and write the result of that comparison in a new variable.
d$post1990 <- d$year >= 1990

# 6 Calculate the mean of the variable outgovshare.
mean(d$outgovshare, na.rm = T)

# 7 Remove the logical variable indicating the post-1990 elections.
d$post1990 <- NULL

# 8 Z-Tranform the variable outgovshare. The function sd() calculates the
# standard deviation of a variable which you need for z-transformation.
# Remember: z = (x - mean(x))/sd(x)
df$outgovshare <- (df$outgovshare - mean(df$outgovshare, na.rm = T)) /
  sd(df$outgovshare, na.rm = T)

# 9 Save the data in a separate file.
write.csv(d, 'data/BundestagForecastReplicationData_edit.csv', row.names = F)