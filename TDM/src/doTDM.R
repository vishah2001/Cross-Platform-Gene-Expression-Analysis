library(BiocInstaller)
library(data.table)
library(binr)
library(scales)
library(devtools)
library(TDM)

#data(meta)
#data(tcga)
#reference <- meta
#target <- tcga
#write.csv(reference, file="C:/Users/visha/OneDrive/Documents/SharedVMTest5/RScripts/ref.csv", quote=F)
#write.csv(target, file="C:/Users/visha/OneDrive/Documents/SharedVMTest5/RScripts/tar.csv", quote=F)

#args = commandArgs(trailingOnly = TRUE)
#referenceRaw <- read.csv(args[2], header = FALSE) #args2
#targetRaw <- read.csv(args[1], header = FALSE) #args1
refCol <- unname(unlist(referenceRaw[1, 2:ncol(referenceRaw)]))
tarCol <- unname(unlist(targetRaw[1, 2:ncol(targetRaw)]))
tarRows <- unname(unlist(targetRaw[2:nrow(targetRaw), 1]))
refRows <- unname(unlist(referenceRaw[2:nrow(referenceRaw), 1]))
reference <- referenceRaw[2:nrow(referenceRaw), 2:ncol(referenceRaw)]
target <- targetRaw[2:nrow(targetRaw), 2:ncol(targetRaw)]

colnames(target) <- tarCol
rownames(target) <- make.names(tarRows, unique=TRUE)
colnames(reference) <- refCol
rownames(reference) <- make.names(refRows, unique=TRUE)

# summary(as.vector(as.matrix(reference)))
# summary(as.vector(as.matrix(target)))

target_modified <- tdm_transform(ref_data = data.table(cbind(gene=rownames(reference), reference)),
                                 target_data = data.table(cbind(gene=rownames(target), target)))
# summary(as.vector(data.matrix(target_modified[,2:ncol(target_modified),with=F])))

#goal <- cbind(reference, target_modified[,2:ncol(target_modified)])
target_modified <- target_modified[,2:ncol(target_modified)]
colnames(target_modified) <- as.character(tarCol)
rownames(target_modified) <- make.names(tarRows, unique=TRUE)
#colnames(reference) <- refCol
#rownames(reference) <- make.names(rows, unique=TRUE)
#cols <- c(as.vector(refCol), as.vector(tarCol))
#colnames(goal) <- cols
#rownames(goal) <- make.names(rows, unique=TRUE)

#write.csv(goal, file="output.csv", quote=F)
#write.csv(target_modified, file="C:/Users/visha/OneDrive/Documents/SharedVMTest5/targetMod.csv", quote=F)
#write.csv(reference, file="reference.csv", quote=F)
