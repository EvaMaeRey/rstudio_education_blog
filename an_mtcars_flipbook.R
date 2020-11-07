set.seed(12345)
library(tidyverse)
mtcars %>% 
  rownames_to_column(var = "car_name") %>% 
  ggplot() +
  aes(x = wt) +
  aes(y = factor(cyl)) +
  ggthemes::theme_solarized() +
  geom_boxplot(fill = "snow2") +
  geom_jitter(height = .2,
              alpha = .7,
              color = "plum3",
              size = 3) +
  labs(title = "How do number of cylanders and car weight relate?") +
  labs(subtitle = "Yet another look at mtcars") +
  labs(y = "cylinder") + 
  labs(x = "weight (thousands of pounds)") +
  theme(plot.title.position = "plot") +
  geom_label(data = tibble(x = 1), # one row dataframe
             fill = "grey90",
             x = 4.6, 
             y = 1.2, # cylinder is a factor w 3 levels
             label = "These observations aren't part of the 'wiskers' of the Tukey box plot. Outliers are observations further than 1.5 IQR from the upper or lower hinge" %>% 
               str_wrap(25)) +
  geom_curve(data = tibble(x = 1),
             curvature = -.2,
             angle = 80,
             x = 4.55, xend = 5.15,
             y = 1.85, yend = 2.8,
             )
