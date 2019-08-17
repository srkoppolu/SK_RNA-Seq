
### Select the current working directory.
WD <- getwd()

### Create a subfolder for the reference files
rWD <- paste0(WD,"ref/")
dir.create(rWD, recursive=T, showWarnings = F)

### setup the paths to the files on the ENSEMBL ftp server
faFTP <- "ftp://ftp.ensembl.org/pub/release-84/fasta/homo_sapiens/dna/"
gtfFTP <- "ftp://ftp.ensembl.org/pub/release-84/gtf/homo_sapiens/"

### the full human genome is in this file 
faFile <- "Homo_sapiens.GRCh38.dna.toplevel.fa.gz"

### the gene annotations are in this file
gtfFile <- "Homo_sapiens.GRCh38.84.gtf.gz"

### run the commands to get the file
download.file(paste0(faFTP,faFile),paste0(rWD,faFile))
download.file(paste0(gtfFTP,gtfFile),paste0(rWD,gtfFile))