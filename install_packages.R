# Check for necessary packages and install if required
options(repos=structure(c(CRAN="https://cloud.r-project.org/")),
        warn = 1)
packages <- c('tidyverse', 'hflights', 'texreg', 'stargazer',
              'broom', 'ggthemes', 'interplot')
for (p in packages) {
  if (p %in% installed.packages()[,1]) {
    print(paste0(p, ' is installed. Will now load ', p,'.'))
    require(p, character.only=T)
  }
  else {
    print(paste0(p, ' is NOT installed. Will now install ', p,'.'))
    install.packages(p)
    require(p, character.only=T)
  }
}
rm(packages, p)