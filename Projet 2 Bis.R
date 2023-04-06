library(tidyverse)
library(nycflights13)
data(flights)
data(airports)
data(airlines)
# Réponse 1
slice(flights, 100:105)
# Réponse 2
filter(flights, month == 7 && month == 9)
# Réponse 3
filter(flights, dep_delay >= 10 & dep_delay <= 15)
# Réponse 4
filter(flights, carrier %in% c("DL", "UA", "AA"))
# Réponse 5
arrange(flights, desc(dep_delay))
# Réponse 6
select(airports, name, lat, lon)
# Réponse 7
select(airports, -tz, -tzone)
# Réponse 8
rename(airports, longitude = lon, latitude = lat)
# Réponse 9
rep9 <- mutate(airports, alt_m = alt / 3.2808)
select(rep9, alt, alt_m)
# Réponse 10
flights %>%
  filter(dest == "SFO") %>%
  arrange(desc(dep_delay))
# Réponse 11
rep11 <- flights %>%
  filter(month %in% c(1, 3)) %>%
  select(dest, dep_delay) %>%
  mutate(retard_h = dep_delay / 60) %>%
  arrange(desc(retard_h))
slice(rep11, 1:15)
# Réponse 12
rep12 <- flights %>%
  group_by(month) %>%
  summarise(nb = n()) %>%
  ungroup()
arrange(rep12, nb)
# Réponse 13
flights %>%
  group_by(origin) %>%
  summarise(distance_moyenne = mean(distance))
# Réponse 14
flights %>%
  filter(origin == "JFK") %>%
  count(month)
# Réponse 15
flights %>%
  count(month, dest)
# Réponse 16
flights %>%
  count(month) %>%
  mutate(pourcentage = n / sum(n) * 100)
# Réponse 17
flights %>%
  select(dest,month,arr_delay) %>%
  group_by(dest) %>%
  summarise(retard_moyenne = round(mean(arr_delay, na.rm = TRUE),2)) %>%
  slice_max(retard_moyenne,n=3)
# Réponse 18
flights %>%
  left_join(airlines)
# Réponse 19
flights %>%
  left_join(airlines) %>%
  group_by(name) %>%
  summarise(retard_moyen = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(retard_moyen))
# Réponse 20
flights %>%
  left_join(airports, by = c("dest" = "faa"))
# Réponse 21
flights_dest <- flights %>%
  count(dest) %>%
  left_join(airports, by = c("dest"="faa"))
# Réponse 22
flights_dest <- flights %>%
  count(dest) %>%
  left_join(airports, by = c("dest"="faa"))