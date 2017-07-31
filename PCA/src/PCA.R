library(ggplot2)

# Extract data from file
#args = commandArgs(trailingOnly = TRUE)
#data <- read.csv(args[1], header = FALSE)

#modData <- data[2:nrow(data), 2:ncol(data)]

#columns <- unname(unlist(data[1,2:ncol(data)]))
#colnames(modData) <- columns

modData <- data

for (col in 1:ncol(modData)) {
  modData[[col]] <- as.character(modData[[col]])
  modData[[col]] <- as.numeric(modData[[col]])
}

modData <- t(modData)

# Do PCA
pca <- prcomp(modData, scale = TRUE)

# Output PCA data
pcadf <- as.data.frame(pca$x)
write.csv(pcadf, file="./output.csv", quote=F)

# Modify data for graphing
pcadf <- pcadf[,1:2]
rows=row.names(pcadf)

# Output the graph
#png(filename="./output_visual.png")
ggplot(pcadf, aes(x=PC1, y=PC2)) + 
  geom_point(aes(color=substring(rows, first = 1, last = 2))) + 
  labs(color = "Legend")
#plot(pcadf)
#dev.off()

