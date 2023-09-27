#penguin project - analysis 

install.packages("tidyverse")
library(tidyverse)

penguin_data <- read_table("data/penguin_data.txt")

spp_bodymass_model <- lm(body_mass_g ~ species, data = penguin_data)
summary(spp_bodymass_model)

ggplot(penguin_data, aes(x = species, y = body_mass_g, colour = species)) + geom_boxplot() + stat_smooth(method = "lm")
ggsave("figs/1_body_mass_species_regression.png")

bill_sex_model <- lm(bill_length_mm ~ sex, data = penguin_data)
summary(bill_sex_model)

#custom <- c("Adelie" = "#FF66CC", "Chinstrap" = "#9900CC", "Gentoo" = "#330066")
ggplot(na.omit(penguin_data), aes(x = sex, y = bill_length_mm, colour = species)) + geom_boxplot() + stat_smooth(method = "lm")
ggsave("figs/1_sex_bill_length_regression.png")

#subesttign the data to only look at females of each species
penguins_female <- subset(penguin_data, sex == "female")
#saving this subset
write_tsv(penguins_female, "results/1_penguin_female_only.txt")
