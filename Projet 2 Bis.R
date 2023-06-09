library(tidyverse)
library(nycflights13)
data(flights)
data(airports)
data(airlines)
# R�ponse 1
slice(flights, 100:105)
# R�ponse 2
filter(flights, month == 7 && month == 9)
# R�ponse 3
filter(flights, dep_delay >= 10 & dep_delay <= 15)
# R�ponse 4
filter(flights, carrier %in% c("DL", "UA", "AA"))
# R�ponse 5
arrange(flights, desc(dep_delay))
# R�ponse 6
select(airports, name, lat, lon)
# R�ponse 7
select(airports, -tz, -tzone)
# R�ponse 8
rename(airports, longitude = lon, latitude = lat)
# R�ponse 9
rep9 <- mutate(airports, alt_m = alt / 3.2808)
select(rep9, alt, alt_m)
# R�ponse 10
flights %>%
  filter(dest == "SFO") %>%
  arrange(desc(dep_delay))
# R�ponse 11
rep11 <- flights %>%
  filter(month %in% c(1, 3)) %>%
  select(dest, dep_delay) %>%
  mutate(retard_h = dep_delay / 60) %>%
  arrange(desc(retard_h))
slice(rep11, 1:15)
# R�ponse 12
rep12 <- flights %>%
  group_by(month) %>%
  summarise(nb = n()) %>%
  ungroup()
arrange(rep12, nb)
# R�ponse 13
flights %>%
  group_by(origin) %>%
  summarise(distance_moyenne = mean(distance))
# R�ponse 14
flights %>%
  filter(origin == "JFK") %>%
  count(month)
# R�ponse 15
flights %>%
  count(month, dest)
# R�ponse 16
flights %>%
  count(month) %>%
  mutate(pourcentage = n / sum(n) * 100)
# R�ponse 17
flights %>%
  select(dest,month,arr_delay) %>%
  group_by(dest) %>%
  summarise(retard_moyenne = round(mean(arr_delay, na.rm = TRUE),2)) %>%
  slice_max(retard_moyenne,n=3)
# R�ponse 18
flights %>%
  left_join(airlines)
# R�ponse 19
flights %>%
  left_join(airlines) %>%
  group_by(name) %>%
  summarise(retard_moyen = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(retard_moyen))
# R�ponse 20
flights %>%
  left_join(airports, by = c("dest" = "faa"))
# R�ponse 21
flights_dest <- flights %>%
  count(dest) %>%
  left_join(airports, by = c("dest"="faa"))
# R�ponse 22
flights_dest <- flights %>%
  count(dest) %>%
  left_join(airports, by = c("dest"="faa"))