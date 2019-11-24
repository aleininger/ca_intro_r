# Introduction to "R"
# Data and model visualisation
#
# Hands-on 1

setwd('put path to the r_workshop folder on your machine here.')

# 1. Load ggplot2.
library(ggplot2)

# 2. Read the file btw2013.csv and assign it to an object. It's in the data folder.
b <- read.csv('data/btw2013.csv', stringsAsFactors = F)

# 3. Create a scatterplot of turnout against unemployment.
ggplot(b, aes(x = unemployment, y = turnout)) + geom_point()

# 4. Label the axes.
ggplot(b, aes(x = unemployment, y = turnout)) + geom_point() +
  xlab('Unemployment') + ylab("")

# 5. Highlight east and west germany by changing the color or shape of the dots.
# Check out scale_color_discrete() or scale_shape_discrete() for modifying the legend.
f <- ggplot(b, aes(x = unemployment, y = turnout)) +
  geom_point(aes(color = east)) +
  xlab('Unemployment') + ylab("Turnout (%)")
f2 <- f + scale_color_discrete(labels = c('West', 'East'),
                       name = element_blank())

# 6. Include two black linear fit lines (with out confidence intervals), one for
# east, one for west. Check the help for geom_smooth to find out how to surpress
# confidence intervals.
f + geom_smooth(aes(group = east), method = 'lm', se = F, color = 'black')

f2 + geom_smooth(method = 'lm', se = F, aes(group = east), color = 'black')

ggplot(b, aes(x = unemployment, y = turnout, color = east)) + geom_point() + geom_smooth(method = 'lm', se = F, aes(color = NULL, group = east))

# 7. Instead of separating dots and lines by east vs. west, facet the plot by
# federal state.
f + facet_wrap(~land)

# 8. You notice a spelling mistake: "Schleswig-Holsten". The correct spelling is
# "Schleswig-Holstein". Correct this mistake.
b$land[b$land == 'Schleswig-Holsten'] <- 'Schleswig-Holstein'

b$land <- ifelse(b$land == 'Schleswig-Holsten', 'Schleswig-Holstein', b$land)

b <- b %>% mutate(land = recode(land, `Schleswig-Holsten` = 'Schleswig-Holstein'))