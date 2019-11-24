################################################################################
# Introduction to R
# Data Analysis
#
# Hands-on 2
################################################################################

# 1. Read the dataset "EUsuppDK.dta" and assign it to an object.
library(foreign)
d <- read.dta('data/EUsuppDK.dta')

# 2. Regress eusupp on gender, wealth and age. Save the result in an object,
# e.g. m1.
m1 <- lm(eusupp ~ sex + wealth + age, d)

# 3. Add left_right to the model. Save it to an object of a different name,
# e.g. m2.
m2 <- lm(eusupp ~ sex + wealth + age + left_right, d)

# 4. Add a quadratic term for left_right. Save this new model to an object.
m3 <- lm(eusupp ~ sex + wealth + age + left_right + I(left_right^2), d)

# 5. Dichotomize wealth, i.e. turn it into a dummy variable distinguishing
# rich respondents and those who are not.

# 6. Estimate a model which includes an interaction between the new wealth variable
# and left_right. Save this model in an object.

# 7. Create a regression table with stargazer or texreg. It can be either HTML
# (if you use word) or TEX (if you use LaTeX).

# 8. Make a publication quality table. This includes at least changing the
# variable labels in the table to capitalized and more comprehensible names.

