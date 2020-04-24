# See references folder for PDFs of papers

library(tidyverse)

dat <- tibble(fl_mm = 25:105,
              Bartholow2004 = -0.67 + 0.0282*fl_mm - 0.000491*fl_mm^2 + 0.0000141*fl_mm^3,      # Kent 1999 reported in Bartholow 2004
              Jager1997 = 0.0005*fl_mm^2.136,                                                   # Jager et al 1997
              Petrusso2001 = exp(3.4852*log(fl_mm) - 6.6088)/1000,                              # Petrusso and Hayes 2001
              Tiffan2014_river = 0.000004*fl_mm^3.2252,                                         # Tiffan et al. 2014
              Tiffan2014_lake = 0.000006*fl_mm^3.1355,                                          # Tiffan et al. 2014
              Zabel2004 = 0.0000287*fl_mm^2.81) %>%                                             # Zabel and Achord 2004
  gather(key = study, value = ww_g, Bartholow2004:Zabel2004)

ggplot(dat, aes(x = fl_mm, y = ww_g, col = study)) +
  geom_line(alpha = 0.7) +
  labs(x = "Fork length (mm)", y = "Wet weight (g)") +
  scale_color_brewer(name = "Study", type = "qual", palette = "Set1") +
  theme_minimal()
ggsave("chinook-length-weight.png", width = 6, height = 3.5)
