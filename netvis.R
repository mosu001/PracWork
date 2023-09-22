setwd("C:/Users/mosu001/OneDrive - The University of Auckland/Documents/uoa/industry-engagement/PracWork")
clean_df <- read.csv("C:/Data/PracWork/cleaned.csv")

levels(as.factor(clean_df$Discipline))

library("igraph")

## Function to wrap long strings
# Source: http://stackoverflow.com/a/7367534/496488
wrap_strings <- function(vector_of_strings,width){
  as.character(sapply(vector_of_strings, FUN=function(x){
    paste(strwrap(x, width=width), collapse="\n")
  }))
}

connects = clean_df[, c("Company.Name", "Discipline")]
colnames(connects) = c("from", "to")
connects$from = wrap_strings(connects$from, 10)
connects$to = wrap_strings(connects$to, 10)

library(dplyr)

weights = connects %>% group_by_all() %>% count
colnames(weights)[3] = "weight"

g <- graph_from_data_frame(weights, directed=F)
#g <- graph_from_data_frame(head(connects, 1000), directed=F)
print(g, e=F, v=F)
#plot(g, vertex.label.dist=1.5)
#node.size= c(10,10,10)
#plot(g, vertex.size=node.size*0.25, vertex.label.dist=1.5)
#plot(g, vertex.size=10, vertex.label=NA)
#tkplot(g)

library(visNetwork)
nodes <- data.frame(id = as.character(V(g)$name),
                    title = as.character(V(g)$name),
                    group = ifelse(V(g)$name %in% connects$to, "Dept", "Company"))
ord = order(nodes$group, -as.numeric(as.factor(nodes$title)), decreasing=T)
snodes <- nodes[ord,]
edges <- get.data.frame(g, what="edges")[1:2]

#visnet graph
netVis = visNetwork(snodes, edges) %>% visIgraphLayout(layout = "layout_with_fr") %>%
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)
print(netVis)














