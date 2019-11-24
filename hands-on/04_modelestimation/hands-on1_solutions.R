# Introduction to "R"
# Model estimation
#
# Hands-on 1

setwd('')

# 1. Read the dataset "EUsuppDK.dta" and assign it to an object. You'll need the
# function read.dta() from the package foreign.
library(foreign)
d <- read.dta('data/EUsuppDK.dta')

# 2. Regress eusupp on gender, wealth and age.
lm(eusupp ~ sex + wealth + age, d)

# 3. Interpret the coefficients. For this obtain the summary() of the model results.
lm(eusupp ~ sex + wealth + age, d) %>% summary()

# 4. Add a quadratic term for age.
lm(eusupp ~ sex + wealth + age + I(age^2), d) %>% summary()

# 5. Try a interaction between sex and age. Remember the operators * and :.
lm(eusupp ~ sex + wealth + age + age:sex, d) %>% summary()

lm(eusupp ~ sex * age + wealth, d) %>% summary()

# 7. Obtain the predicted values for the following model: eusupp ~ sex + wealth + age.
# Save them to an object yhats.
summary(m <- lm(eusupp ~ sex + wealth + age, d))
yhats <- predict(m)
yhats

# 8. Then also create a variable containing the predicted values in the original
# data.frame. Hint: simply assing yhats won't work.
d$yhats <- predict(m, newdata = d)

# 9. If you use the model to predict eusupp. How far off are your predictions
# on average?
mean(abs(resid(m)))

# 10. How supportive of the EU do you expect a very rich 50 year old woman to be
# based on your regression model?
df <- data.frame(sex = 'female', wealth = '++', age = 50)

predict(m, newdata = df)
