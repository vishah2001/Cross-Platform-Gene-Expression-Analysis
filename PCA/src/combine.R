library(ggplot2)

# Extract data from file
args = commandArgs(trailingOnly = TRUE)
input <- read.csv(args[1])

#splitLine <- which(data[[1]] == "REFERENCE")[2]
#d <- split(data,rep(1:2,each=splitLine-1))
dfchunk <- split(input, factor(sort(rank(row.names(input))%%2)))
tar <- dfchunk[[1]]
ref <- dfchunk[[2]]

combine <- cbind(ref, tar[,2:ncol(tar)])

cols <- unname(unlist(combine[1, 2:ncol(combine)]))
rows <- unname(unlist(combine[2:nrow(combine), 1]))

goal <- combine[2:nrow(combine), 2:ncol(combine)]
colnames(goal) <- cols
rownames(goal) <- make.names(rows, unique=TRUE)

data <- goal
source("./PCA.R")



#write.csv(goal, file="output.csv", quote=FALSE)

