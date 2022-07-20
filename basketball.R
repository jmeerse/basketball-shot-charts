install.packages("hoopR")
install.packages("janitor")
install.packages("slider")

library(tidyverse)
library(hoopR)
library(janitor)
library(slider)

shots <- furrr::future_map_dfr(c("Regular Season", "Playoffs"), ~nba_shotchartdetail(season = "2021-22",
                                                                                      season_type = .,
                                                                                      player_id = 0) %>% 
                                  pluck("Shot_Chart_Detail")) %>% 
  clean_names()

