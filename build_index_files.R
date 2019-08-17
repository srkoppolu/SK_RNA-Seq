## Extract Fastq files from database

## Select the current working directory with the reference files
WD <- getwd()

### SRA identifier for the data
SRA.ID <- "SRP045534"

### First, download the database file (SQL file)
source("PackageLoad2.R")
PackageLoad2("SRAdb")
sql.file <-'SRAmetadb.sqlite'
if(!file.exists('SRAmetadb.sqlite')) {
  sql.file <<- getSRAdbFile()
}
sra.con <- dbConnect(SQLite(), sql.file)

### Obtain the metadata for the file 
sra.meta <- getSRAinfo(sra.ID, sra.con, sraType = "sra")

### Download the sra files
sapply(sra.meta$run, function(x) try(getSRAfile(x, sra.con, fileType = "sra"), silent = TRUE))

# #### Run the following code within the terminal
# ### Extract the fastq files from the sra archive files using the 
# ### NCBI's sra-toolkit command line utility
# for sra in *.sra
# do
# fastq-dump $sra
# done