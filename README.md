# Differential expression and PPI networks

Transcriptomic analysis of iPSC-derived dopaminergic neurons in hereditary Parkinson's disease (LRRK2 and Parkin mutations).

🔗 **Access the full study report:** [Quarto report](http://download.ripcm.com/PARK2023/ParkRNASeq/ParkRNASeq.html)

## Purpose
- Quality control (PCA, PERMANOVA)
- Differential expression analysis (DESeq2) for four contrasts:
  - PD vs healthy
  - LRRK2 vs healthy
  - Parkin vs healthy
  - LRRK2 vs Parkin
- Extraction of robust condition‑specific signatures (intersections of DEGs)
- Protein‑protein interaction network construction (STRING) with MCL clustering
- Validation of clusters via GSEA

## Requirements
- R (≥4.2)
- Packages: `tidyverse`, `ggplot2`, `ggpubr`, `ggdist`,`RColorBrewer`, `rcartocolor`, `lmerTest`, `broom.mixed`, `vegan`, `multcomp`, `pairwiseAdonis`, `DESeq2`, `clusterProfiler`, `GseaVis`, `EnhancedVolcano`, `factoextra`, `UpSetR`, `DT`, `downloadthis`, `purrr`, `ggfortify`

## How to run
1. Clone the repository
2. Open `ParkRNASeq.qmd` in RStudio → Render

## Data
- Raw RNA-seq data: NCBI BioProject [PRJNA1346308](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1346308/).
- Processed normalized counts and metadata are provided in `data/` where distribution is permitted.

## Related publication
*Convergent transcriptomic signature in iPSC-dopaminergic neurons of hereditary Parkinson’s disease* Life science alliance
DOI: (to be added after publication)

## License
MIT
