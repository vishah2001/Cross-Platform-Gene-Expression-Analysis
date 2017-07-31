args = commandArgs(trailingOnly = TRUE)
data <- read.csv(args[1], header = FALSE)

dfchunk <- split(data, factor(sort(rank(row.names(data))%%2)))
targetRaw <- dfchunk[[1]]
referenceRaw <- dfchunk[[2]]

source("./doTDM.R")

tarCol <- as.list(c("TARGET", as.character(tarCol)))
target_mod_raw <- cbind(tarRows, target_modified)
target_mod_raw <- rbindlist(list(tarCol, target_mod_raw))
combineTable <- rbindlist(list(target_mod_raw, referenceRaw))

finalRows <- unlist(combineTable[,1])
combineTable <- combineTable[,-1]
rownames(combineTable) <- make.names(finalRows, unique=TRUE)
colnames(combineTable) <- as.character(c(1:ncol(combineTable)))

write.csv(combineTable, "./output.txt", quote=FALSE)

# datas <- read.csv("C://Users/visha/OneDrive/Documents/SharedVMTest5/TDMwithPython/output.txt", header=TRUE)



