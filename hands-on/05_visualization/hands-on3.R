# Introduction to "R"
# Data and model visualisation
#
# Hands-on 3

setwd('put path to the r_workshop folder on your machine here.')

# 1. Load the file 'anes.dta' and assign its contents to a data.frame object.
# It contains the national election survey for the 2000 US presidential election
# which pitted incumbent party candidate Al Gore against Republican George W.
# Bush. The variable vote indicates a vote for George W. Bush (1) or Gore (0).
# You'll need the function read.dta() from the package foreign.

library(foreign)
d <- read.dta('data/anes.dta')

# 1.1 The gender variable codes men as 2 and women as 1. Create a dummy variable
# called female from this variable.

# 2. Estimate the following model and save it to an object "m1". Complete the
# following code.
glm(vote ~ age + black + lib_con, d, family = binomial())

# Now create a coefficient plot for the model.

# 3. Start by extracting the coefficient estimates and corresponding 95% cofidence
# intervals from the model and saving them to a data.frame.

# 4. Now plot this new data.frame. Use geom_point() for the coefficient estimates
# and geom_errorbar() for the confidence intervals.

# 5. The intercept is on entirely different scale as the other coefficients.
# Improve the plot through omitting the intercept.


# Now we plot an interaction in a logistic model.

# 6. First, estimate the following model and save it to an object "m2".
m2 <- glm(vote ~ age + black * lib_con, d, family = binomial())


# 7. Now create a data.frame which varies the key independent variables.


# 8. Create predicted probabilities from the model and save the predicted values in the
# new data.frame.
df$pred <- predict(m2, newdata = df, type = 'response')

# 9. Plot the interaction with the predicted values on the y-axis and the
# continuous independent variable on the x-axis.



# 10. Create a marginal effects plot using interplot.
# Fist, load the package 'interplot'
library(interplot)

# Then create a plot of the marginal effect of 'black' conditional on 'lib_con'.
interplot(m2, var1 = 'black', var2 = 'lib_con')

# Also create a marginal effect plot for 'lib_con' conditional on 'black'.
interplot(m2, var1 = 'lib_con', var2 = 'black')