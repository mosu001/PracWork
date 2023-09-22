# Load the required libraries
library(treemapify)
library(ggplot2)
library(dplyr)

# Read data from a CSV file (replace 'your_file.csv' with your actual CSV file)
df <- read.csv('C:/Data/PracWork/cleaned.csv')

# Create a data frame with counts of disciplines for each company
company_discipline_counts <- df %>%
  group_by(Company.Name, Discipline) %>%
  summarize(Count = n()) %>%
  ungroup()

# Calculate the total count of disciplines for each company
company_total_counts <- company_discipline_counts %>%
  group_by(Company.Name) %>%
  summarize(TotalCount = sum(Count)) %>%
  arrange(desc(TotalCount))

# Select the top 20 companies
top_20_companies <- company_total_counts %>%
  slice(1:20)

# Filter the original data to include only the top 20 companies
df_filtered <- df %>%
  filter(Company.Name %in% top_20_companies$Company.Name)

# Create the treemap plot using company_discipline_counts
ggplot(data = company_discipline_counts, aes(area = Count, fill = Discipline)) +
  geom_treemap() +
  geom_treemap_text(aes(label = paste(Discipline, "\n", Count)),
                    fontface = "italic", size = 5, color = "white") +
  facet_wrap(~ Company.Name) +
  theme(legend.position = "none") +
  labs(title = "Treemap of Disciplines by Top 20 Companies")
