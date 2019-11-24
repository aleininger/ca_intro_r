# Introduction to "R"
# Introduction to R and RStudio
#
# Hands-on 1

# 1. Add two and four and divide by 3
(2 + 4) / 3

# 2. Perform this calculation again and save it to an object called a
a <- (2 + 4) / 6

# 3. Calculate the result of the division of 23/7 and save it to an object b
b <- 23 / 7

# 4. print the content of b to the console
print(b)  # or simply
b

# 5. substract object a from object b
b - a

# 6. Save the result of b - a in b
b <- b - a

# 7. Use rnorm() to create 10 random draws from a standard normal
# Remember that you can use the 'tab' key to obtain tooltips for the function
rnorm(n = 10, mean = 0, sd = 1)

# 8. call up the help file for the function rnorm(). What happens if you run
# rnorm(10)?

?rnorm

print('rnorm() will produce 10 random draws from a standard normal.')

rnorm(10)

# 9. Try different pane layouts and editor themes to find your preferred setup.
# Tools > Global Options

# Some mathematical expressions in R
# 2 + 2 # Addition
# ## [1] 4
#
# 3 - 2 # Substraction
# ## [1] 1
#
# 2 * 2 # Multiplication
# ## [1] 4
#
# 10 / 3 # Division
# ## [1] 3.333333
#
# 10 %% 3 # Remainder
# ## [1] 1
#
# 10 %/% 3 # Quotient
# ## [1] 3