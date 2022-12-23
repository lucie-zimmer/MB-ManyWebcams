# A small script to report the validation data produced by webgazer for the lmu sample
library(tidyverse)

validation_data <- read.csv("lmu_validation_data.csv")
validation_data <- validation_data[,-which(names(validation_data) %in% c("X"))]

mean_offset_x_percent <- mean(abs(validation_data$avg_offset_x_percent))
sd_offset_x_percent <- sd(abs(validation_data$avg_offset_x_percent))
mean_offset_y_percent <- mean(abs(validation_data$avg_offset_y_percent))
sd_offset_y_percent <- sd(abs(validation_data$avg_offset_y_percent))

deterioration <- validation_data |> 
  pivot_wider(names_from = index, values_from = -c(index, subid)) |>
  mutate(y_det = abs(avg_offset_y_percent_1) - abs(avg_offset_y_percent_0),
         x_det = abs(avg_offset_x_percent_1) - abs(avg_offset_x_percent_0)) |> 
  select(subid, y_det, x_det)

mean_x_det <- mean(deterioration$x_det)
sd_x_det <- sd(deterioration$x_det)
cohens_delta_x <- mean_x_det / sd_x_det
t.test(deterioration$x_det, mu = 0, alternative = "two.sided")

mean_y_det <- mean(deterioration$y_det)
sd_y_det <- sd(deterioration$y_det)
cohens_delta_y <- mean_y_det / sd_y_det
t.test(deterioration$y_det, mu = 0, alternative = "two.sided")



