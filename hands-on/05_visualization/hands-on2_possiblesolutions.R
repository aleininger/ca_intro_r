# Introduction to "R"
# Data and model visualisation
#
# Hands-on 2

setwd('put path to the r_workshop folder on your machine here.')

# 1. Read the data and assign it to an object.
b <- read.csv('data/bowleretal2016_tab1.csv', stringsAsFactors = F)

# 2. Create the figure that you think is appropriate.
library(ggplot2)
library(dplyr)

b <- b %>% arrange(country, referendumsgood) %>% mutate(order = 1:nrow(b))

ggplot(b, aes(x = factor(order),
              y = referendumsgood, fill = country)) +
  geom_bar(stat = 'identity') +
  scale_x_discrete(labels = b$party) +
  scale_fill_discrete(guide = guide_legend(reverse = TRUE), name = '') +
  xlab('') + ylab('') +
  coord_flip() + theme(legend.position = 'bottom')

# Robert Krikawa's (WU Wien) solution ------------------------------------------

df <- b
p1 <- ggplot(df,aes(x=party,y=referendumsgood)) + geom_bar(stat="identity") +
  facet_grid(~country, scales = 'free')

p1 + theme(axis.text.x = element_text(face="bold", color="black",
                                      size=14, angle=90, hjust = 1))

# Verena Patock's (WU Wien) solution -------------------------------------------

ggplot(b, aes(x = party, y = referendumsgood)) +
  geom_point(aes(color = country)) +
  facet_wrap(~country, scales = 'free', ncol = 1) +
  xlab('Party') + ylab('Referendum (%)') +
  scale_color_discrete(labels = c(), name = element_blank())


# Farida Hasan's (Hertie School) solution --------------------------------------

ggplot(d, aes(x=party, y=referendumsgood, fill=country)) +
  geom_bar(stat="identity") +
  facet_wrap(~country, nrow=3, ncol=1, scales="free") +
  coord_flip()