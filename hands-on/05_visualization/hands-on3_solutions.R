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
# called female from this variable (Female = 1, other = 0).
d$female <- d$gender == 1

# 2. Estimate the following model and save it to an object "m1". Complete the
# following code.
m1 <- glm(vote ~ age + black + lib_con, d, family = binomial())

# Now create a coefficient plot for the model.

# 3. Start by extracting the coefficient estimates and corresponding 95% cofidence
# intervals from the model and saving them to a data.frame.

coefs <- data.frame(names(coef(m1)), coef(m1), confint(m1))
names(coefs) <- c('var', 'coef', 'lwr', 'upr')


# 4. Now plot this new data.frame. Use geom_point() for the coefficient estimates
# and geom_errorbar() for the confidence intervals.
library(ggplot2)

ggplot(coefs, aes(var, coef)) +
  geom_hline(yintercept = 0, linetype = 'dashed') +
  geom_point() +
  geom_errorbar(aes(ymin = lwr, ymax = upr), width = 0) +
  xlab('') + ylab('Coefficient estimate') +
  coord_flip() + theme_minimal()

# 5. The intercept is on entirely different scale as the other coefficients.
# Improve the plot through omitting the intercept.

coefs <- coefs[-1,]
ggplot(coefs, aes(var, coef)) +
  geom_hline(yintercept = 0, linetype = 'dashed') +
  geom_point() +
  geom_errorbar(aes(ymin = lwr, ymax = upr), width = 0) +
  xlab('') + ylab('Coefficient estimate') +
  coord_flip() + theme_minimal()

# Now we plot an interaction in a logistic model.

# 6. First, estimate the following model and save it to an object "m2".
m2 <- glm(vote ~ age + black * lib_con, d, family = binomial())

# 7. Now create a data.frame which varies the key independent variables.
df <- rbind(
  data.frame(age = mean(d$age, na.rm = T),
                 black = 1,
                 lib_con = min(d$lib_con, na.rm = T):max(d$lib_con, na.rm = T)),
  data.frame(age = mean(d$age, na.rm = T),
             black = 0,
             lib_con = min(d$lib_con, na.rm = T):max(d$lib_con, na.rm = T))
  )

# 8. Create predicted probabilities from the model and save the predicted values in the
# new data.frame.

df$pred <- predict(m2, newdata = df, type = 'response')
se <- predict(m2, newdata = df, type = 'response', se.fit = T)
df$se <- se$se.fit # save standard error
df$lwr <- df$pred - 1.96 * df$se
df$upr <- df$pred + 1.96 * df$se

# 9. Plot the interaction with the predicted values on the y-axis and the
# continuous independent variable on the x-axis.

ggplot(df, aes(x = lib_con, y = pred, ymin = lwr, ymax = upr,
               color = as.factor(black), fill = as.factor(black))) +
  geom_ribbon(alpha = .5) + geom_line()


ggplot(df, aes(x = lib_con, y = pred, ymin = lwr, ymax = upr)) +
  geom_ribbon(aes(fill = as.factor(black)), alpha = .5) +
  geom_line(aes(color = as.factor(black)))

# 10. Create a marginal effects plot using interplot.
# Fist, load the package 'interplot'
library(interplot)

# Then create a plot of the marginal effect of 'black' conditional on 'lib_con'.
interplot(m2, var1 = 'black', var2 = 'lib_con')

# Also create a marginal effect plot for 'lib_con' conditional on 'black'.
interplot(m2, var1 = 'lib_con', var2 = 'black')