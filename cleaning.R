#setwd("C:/Users/mosu001/OneDrive - The University of Auckland/Documents/uoa/industry-engagement/PracWork")
setwd("C:/Data/PracWork")


library(dplyr)
library(tidyverse)
library(ggplot2)
raw_df <- read.csv("C:/Data/PracWork/practical_work_registration report 29-03-2023.csv")
sort_df <- raw_df[order(raw_df$Company.Name),]

invalid = c(
  "",
  "...",
  "5b Kindergarten Dr, Conifer Grove","#NAME?"
)

valid_df = sort_df[!(sort_df$Company.Name %in% invalid),]

needsChange = c(
  " (aerospace New Business Networks Company Limited)",
  "(fujian Liansheng Paper Industry Co., Ltd.)",
  "9spokes International Limited", "2022 Nz Robot Olympiad","9 Spokes","9 Spokes International","9spokes International","9spokes International Limited",
  "Abb Napier","Abb Nz Ltd", "Abb Ltd","Acciona Construction", "Accord Precision Machining","Ach Conuslting Ltd","Ach Consulting Engineers",
  "Active Engineering","Advanced Aerospace Ltd","Advanced Aerospace","Advanced Personal","Advanced Personnel Services Ltd","Aecom Nz",
  "Aecom Ltd","Aecom New Zealand Limited","Aecom New Zealand","Aeroqual Ltd","Air Liquide New Zealand Limited","Air Liquide New Zealand",
  "Air New Zealand Engineering Services","Airlab","Alchemy Systems Ltd","Alimetry Ltd.","Amazon Web Services New Zealand Limited","Amazon Web Services Nzl Ltd",
  "Amphenol Phitek Limited - Auckland, New Zealand","Apollo Living - Commercial  Residential","Apple New Zealand","Apple","Apple Technology Services (apple)",
  "Ar  Associated Ltd", "Aroa Biosurgery","Aroa Biosurgery Ltd","Aroa","Arup","Arup New Zealand", "Asb","Asb Bank","Asbuilt Digital","Asbuilt Ltd",
  "Asona Limited", "Aspec", "Atlassian Corporation Plc", "Auckland Bioengineering Institute","Auckland Bioengineering Institute - Empathic Computing Laboratory",
  "Auckland Bioengineering Institute, The University Of Auckland", "Auckland Bioengineering Institute (abi)", "Auckland Bio Engineering Institute",
  "Auckland Bioengineering Institute, University Of Auckland", "Auckland Bioengineering Institute - Implantable Devices Group",
  "Auckland Biomedical Engineering", "Auckland Space Institute - Te Pnaha tea","Auckland Uniservices Limited", "Auckland University",
  "Auckland University Maker Space", "Aurecon, Tauranga","Aurecon, New Zealand", "Aurecon Nz", "Aurecon New Zealand", "Aurecon New Zealand Limited",
  "Aurecon Group Ltd. - Auckland, New Zealand", "Aurecon New Zealand Ltd","Aurecon Group Ltd.", "Aurecon Group", "Aut School Of Science Research",
  "Aut Internship", "Aviat Networks Nz", "Awa Environmental"
  
  )
change <- c(
  " (aerospace New Business Networks Company Limited)"="Aerospace New Business Networks Company Limited",
  "(fujian Liansheng Paper Industry Co., Ltd.)"="Fujian Liansheng Paper Industry Co., Ltd.",
  "9spokes International Limited"="9 Spokes International Limited",
  "2022 Nz Robot Olympiad" = "2022 Nz Robotics Olympiad",
  "22 Degrees Building Services Engineering"= "22 Degrees Ltd",
  "9 Spokes"="9 Spokes International Limited",
  "9 Spokes International"="9 Spokes International Limited",
  "9spokes International"="9 Spokes International Limited",
  "9spokes International Limited"="9 Spokes International Limited",
  "Abb Napier"="Abb",
  "Abb Nz Ltd"="Abb",
  "Abb Ltd"="Abb",
  "Acciona Construction"="Acciona",
  "Accord Precision Machining"="Accord Precision Cnc Machining",
  "Ach Consulting Engineers"="Ach Consulting Ltd",
  "Ach Conuslting Ltd"="Ach Consulting Ltd",
  "Active Engineering"="Active Engineering Limited",
  "Advanced Aerospace Ltd"="Advanced Aerospace Limited",
  "Advanced Aerospace"="Advanced Aerospace Limited",
  "Advanced Personal"="Advanced Personnel",
  "Advanced Personnel Services Ltd"="Advanced Personnel",
  "Aecom Nz"="Aecom",
  "Aecom Ltd"="Aecom",
  "Aecom New Zealand Limited"="Aecom",
  "Aecom New Zealand"="Aecom",
  "Aeroqual Ltd"="Aeroqual",
  "Air Liquide New Zealand"="Air Liquide",
  "Air Liquide New Zealand Limited"="Air Liquide",
  "Air New Zealand Engineering Services"="Air New Zealand",
  "Airlab"="Airlab Ltd",
  "Alchemy Systems Ltd"="Alchemy Systems Limited",
  "Alimetry Ltd."="Alimetry",
  "Amazon Web Services New Zealand Limited"="Amazon Web Services",
  "Amazon Web Services Nzl Ltd"="Amazon Web Services",
  "Amphenol Phitek Limited - Auckland, New Zealand"="Amphenol Phitek Limited",
  "Apollo Living - Commercial  Residential"="Apolloliving Limited",
  "Apple"="Apple Inc.",
  "Apple New Zealand"="Apple Inc.",
  "Apple Technology Services (apple)"="Apple Inc.",
  "Ar  Associated Ltd"="Ar  Associates Ltd",
  "Aroa Biosurgery"="Aroa Biosurgery Limited",
  "Aroa Biosurgery Ltd"="Aroa Biosurgery Limited",
  "Aroa"="Aroa Biosurgery Limited",
  "Arup"="Arup New Zealand Limited",
  "Arup New Zealand"="Arup New Zealand Limited",
  "Asb"="Asb Bank Limited",
  "Asb Bank"="Asb Bank Limited",
  "Asbuilt Ltd"="Asbuilt",
  "Asbuilt Digital"="Asbuilt",
  "Asona Limited"="Asona",
  "Aspec"="Aspec Construction",
  "Atlassian Corporation Plc"="Atlassian",
  "Auckland Bioengineering Institute"="The University of Auckland",
  "Auckland Bioengineering Institute - Empathic Computing Laboratory"="The University of Auckland",
  "Auckland Biomedical Engineering"="The University of Auckland",
  "Auckland Bioengineering Institute, The University Of Auckland"="The University of Auckland",
  "Auckland Bioengineering Institute (abi)"="The University of Auckland",
  "Auckland Bio Engineering Institute"="The University of Auckland",
  "Auckland Bioengineering Institute, University Of Auckland"="The University of Auckland",
  "Auckland Bioengineering Institute - Implantable Devices Group"="The University of Auckland",
  "Auckland Space Institute - Te Pnaha tea"="The University of Auckland",
  "Auckland Uniservices Limited"="The University of Auckland",
  "Auckland University"="The University of Auckland",
  "Auckland University Maker Space"="The University of Auckland",
  "Aurecon, Tauranga"="Aurecon Group Ltd",
  "Aurecon, New Zealand"="Aurecon Group Ltd",
  "Aurecon Nz"="Aurecon Group Ltd",
  "Aurecon New Zealand"="Aurecon Group Ltd",
  "Aurecon New Zealand Limited"="Aurecon Group Ltd",
  "Aurecon Group Ltd."="Aurecon Group Ltd",
  "Aurecon Group Ltd. - Auckland, New Zealand"="Aurecon Group Ltd",
  "Aurecon New Zealand Ltd"="Aurecon Group Ltd",
  "Aurecon Group"="Aurecon Group Ltd",
  "Aut School Of Science Research"="Aut",
  "Aut Internship"="Aut",
  "Aviat Networks Nz"="Aviat Networks",
  "Awa Environmental"="Awa Environmental Ltd",
  
 
)

change_df = valid_df
change_df$Company.Name = ifelse(
  change_df$Company.Name %in% needsChange,
  change[change_df$Company.Name],
  change_df$Company.Name 
)

final_df = change_df

write.csv(final_df, "cleaned.csv")
