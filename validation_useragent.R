# A small script to report the validation and device data produced by webgazer
library(dplyr)

data_all <- read.csv("./extraction_from_raw/data_validation_useragent.csv")
excluded <- readLines("ManyWebcams_Exclusion_final.txt")
excluded_clean <- excluded[excluded != "" & !startsWith(excluded, "#")]


data <- data_all %>% filter(!(subid %in% excluded_clean))


mean_offset_x_percent <- mean(c(abs(data$avg_offset_x_percent_0), abs(data$avg_offset_x_percent_1)))
mean_offset_x_percent 
sd_offset_x_percent <- sd(c(abs(data$avg_offset_x_percent_0), abs(data$avg_offset_x_percent_1)))
sd_offset_x_percent
mean_offset_y_percent <- mean(c(abs(data$avg_offset_y_percent_0), abs(data$avg_offset_y_percent_1)))
mean_offset_y_percent
sd_offset_y_percent <- sd(c(abs(data$avg_offset_y_percent_0), abs(data$avg_offset_y_percent_1)))
sd_offset_y_percent

deterioration <- validation_data %>% 
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


data <- data %>% mutate(screen_dimension = paste(window_width, window_height, sep="x"))

table(data$screen_dimension)
table(data$browser_family)

table(data$os_name_for_study)

data_os_renamed <- data
data_os_renamed <- data_os_renamed %>% mutate(os_name_for_study = ifelse(startsWith(os_name_for_study, "macOS"), "macOS", os_name_for_study)) # Keep this line in to treat all macOS Versions the same
table(data_os_renamed$os_name_for_study)
data_os_renamed <- data_os_renamed %>% mutate(os_name_for_study = ifelse(startsWith(os_name_for_study, "Windows"), "Windows", os_name_for_study)) # Keept his line to treat all Windows Versions the same
table(data_os_renamed$os_name_for_study)

