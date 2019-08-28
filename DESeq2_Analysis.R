

# Create a `DESeqDataSet` object using the count matrix and the metadata table, and specify the design formula
dds <- DESeqDataSetFromMatrix(countData = data, colData = meta, design = ~ condition)

# Normalizing the counts data using DESeq2's median of ratios method can be done using estimateSizeFactors() function, however it automatically performed by the DESeq() function. 

# Run the differential expression analysis using a single call to the function DESeq(): use the same variable name to fill in the slots of the DESeqDataSet object.
dds <- DESeq(dds)

# Store the results in a different variable
res <- results(dds)

# Order results by padj value (most significant to least) after thresholding
res <- subset(res, padj < 0.05)
res <- res[order(res$padj),] 

# save data results and normalized reads to csv
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
names(resdata)[1] <- 'gene'
write.csv(resdata, file = "Sample_DESEq2-results-with-normalized.csv")

# send normalized counts to tab delimited file for GSEA, etc.
write.table(as.data.frame(counts(dds),normalized=T), file = "Sample_DESEq2_normalized_counts.txt")

# produce DataFrame of results of statistical tests
mcols(res, use.names = T)
write.csv(as.data.frame(mcols(res, use.name = T)),file = "Sample_DESEq2-test-conditions.csv"))

# replacing outlier value with estimated value as predicted by distrubution using
# "trimmed mean" approach. recommended if you have several replicates per treatment
# DESeq2 will automatically do this if you have 7 or more replicates

ddsClean <- replaceOutliersWithTrimmedMean(dds)
ddsClean <- DESeq(ddsClean)
tab <- table(initial = results(dds)$padj < 0.05,
             cleaned = results(ddsClean)$padj < 0.05)
addmargins(tab)
write.csv(as.data.frame(tab),file = "Sample_DESEq2-replaceoutliers.csv"))
resClean <- results(ddsClean)
resClean = subset(res, padj<0.05)
resClean <- resClean[order(resClean$padj),]
write.csv(as.data.frame(resClean),file = "Sample_DESEq2-replaceoutliers-results.csv"))
