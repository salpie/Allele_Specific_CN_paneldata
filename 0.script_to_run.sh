##############################################################################
# Go from fastq files to BAM files.
# QC fatsqs using fatsqc, Map files using BWA, mark duplicates using picard
# calculate coverage statistica dn check BAM using bamQC
##############################################################################

#files list should have 1 column
filelist=/SAN/colcc/IBD/whole_exome/scripts/names_names.txt

refgenome=/share/ref/GRCh38/ucsc/hg38.fa

source /SAN/colcc/EPICC/scripts/epicc_pipeline.source

##############################################################################
#set up directories and filenames
results_dir=/SAN/colcc/IBD/whole_exome

patient=$(awk -v var="${SGE_TASK_ID}" 'NR ==var { OFS="\t";print $1}' $filelist)

1.get_off_and_on_targets.sh

2.rsSNPs_for_BAF.sh

