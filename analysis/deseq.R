if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2")

BiocManager::install("apeglm")

library("DESeq2")

# browseVignettes("DESeq2")

directory <- "htseq_out"

sampleFiles <- grep("*.counts",list.files(directory),value=TRUE)

View(sampleFiles)

sampleTable <- read.table("metadata.tsv", sep="\t", header = TRUE)

sampleTable$condition <- factor(sampleTable$Health.PD)


ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)


ddsHTSeq$condition <- relevel(ddsHTSeq$condition, ref = "H")

ddsHTSeq

dds <- DESeq(ddsHTSeq)


resultsNames(dds) 
res <- results(dds, name="condition_PD_vs_H")
res

resOrdered <- res[order(res$pvalue),]
resOrdered

summary(resOrdered)

ddsCity <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                      directory = directory,
                                      design= ~ Cells.Msc.SPb + condition)
ddsCity$condition <- relevel(ddsCity$condition, ref = "H")
ddsCityRes <- DESeq(ddsCity)
resCity <- results(ddsCityRes)
resCity
resCityOrdered <- resCity[order(res$pvalue),]
resCityOrdered

#plotMA(resCity)
#idx <- identify(resCity$baseMean, resCity$log2FoldChange)
#rownames(resCity)[idx]

rownames(resCityOrdered)[0:10]
rownames(resOrdered)[0:10]


all.equal(resCityOrdered$padj[0:20], resOrdered$padj[0:20])


rownames(resCityOrdered)[2345]
rownames(resOrdered)[2345]









#res <- lfcShrink(dds, coef="condition_PD_vs_H", type="apeglm")
