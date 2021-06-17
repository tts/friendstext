library(tidyverse)
library(friends)
library(ggpage)

head(friends, 10)

# From ggpage intro
friends %>%
  filter(season == 1 & episode == 1) %>% 
  ggpage_build() %>%
  mutate(long_word = stringr::str_length(word) > 14) %>%
  ggpage_plot(aes(fill = long_word)) +
  labs(title = "Longer words throughout Friends-box") +
  scale_fill_manual(values = c("grey70", "blue"),
                    labels = c("8 or less", "9 or more"),
                    name = "Word length")

longs <- friends %>%
  ggpage_build() %>%
  mutate(long_word = stringr::str_length(word) > 14) %>% 
  filter(long_word) %>% 
  select(word) %>% 
  arrange(desc(stringr::str_length(word)))
