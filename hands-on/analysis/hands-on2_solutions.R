################################################################################
# Introduction to R
# Data Analysis
#
# Hands-on 2
################################################################################

setwd('')

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
d$wealthy <- ifelse(d$wealth == '++' | d$wealth == '+', TRUE, F)

d$wealthy <- NA
d$wealthy[which(d$wealth == '++' | d$wealth == '+')] <- T
d$wealthy[which(d$wealth == '--' | d$wealth == '-')] <- F

# 7. Estimate a model which includes an interaction between the new wealth variable
# and left_right. Save this model in an object.
m4 <- lm(eusupp ~ sex + wealthy * left_right + age, d)

# 8. Create a regression table with stargazer or texreg. It can be either HTML
# (if you use word) or TEX (if you use LaTeX).
library(texreg)
htmlreg(list(m1, m2, m3, m4), file = 'table.html')

# 8. Make a publication quality table. This includes at least changing the
# variable labels in the table to capitalized and more comprehensible names.
library(texreg)
library(stargazer)

screenreg(list(m1, m2, m3, m4))

htmlreg(list(m1, m2, m3, m4),
          custom.coef.names =
         c(NA, 'Female', 'Wealthy', 'Poor', 'Very Poor',
           'Age', 'Left-Right', 'Left-Right$^2$',
           'Wealthy', 'Wealthy$\times$Left-Right'),
            reorder.coef = c(2:9, 1),
       file = "table_pub.html")

texreg(list(m1, m2, m3, m4),
        custom.coef.names =
          c(NA, 'Female', 'Wealthy', 'Poor', 'Very Poor',
            'Age', 'Left-Right', 'Left-Right$^2$',
            'Wealthy', 'Wealthy$\times$Left-Right'),
        reorder.coef = c(2:9, 1),
        file = "table_pub.tex")

stargazer(list(m1, m2, m3, m4),
          type = 'text',
          covariate.labels = c('Female',
                              'Wealthy', 'Poor', 'Very Poor', 'Wealthy',
                              'Age', 'Wealthy X Left-Right',
                              'Left-Right', 'Left-Right\\^2', NA))