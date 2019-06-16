# Tidyverse library
library(tidyverse)

# mpg data sets
mpg

# ggplot
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
