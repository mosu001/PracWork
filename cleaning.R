setwd("C:/Users/mosu001/OneDrive - The University of Auckland/Documents/uoa/industry-engagement/PracWork")
raw_df <- read.csv("~/uoa/industry-engagement/PracWork/practical_work_registration report 29-03-2023.csv")
sort_df <- raw_df[order(raw_df$Company.Name),]

invalid = c(
  "",
  "...",
  "5b Kindergarten Dr, Conifer Grove"
)

valid_df = sort_df[!(sort_df$Company.Name %in% invalid),]

needsChange = c(
  " (aerospace New Business Networks Company Limited)",
  "(fujian Liansheng Paper Industry Co., Ltd.)",
  "9spokes International Limited"
)
change <- c(
  " (aerospace New Business Networks Company Limited)"="Aerospace New Business Networks Company Limited",
  "(fujian Liansheng Paper Industry Co., Ltd.)"="Fujian Liansheng Paper Industry Co., Ltd.",
  "9spokes International Limited"="9 Spokes International Limited"
)

change_df = valid_df
change_df$Company.Name = ifelse(
  change_df$Company.Name %in% needsChange,
  change[change_df$Company.Name],
  change_df$Company.Name 
)
