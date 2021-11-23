
#cat /SAN/colcc/IBD/whole_exome/ONTARGET/SNPBED/bed* > /SAN/colcc/IBD/whole_exome/ONTARGET/SNPBED/all_hg38_SNPs.bed.gz

/share/apps/genomics/samtools-1.9/bin/samtools index /SAN/colcc/IBD/whole_exome/finalbams/on_target${patient}.bam

/SAN/colcc/grahamlab-software/bam-readcount/bin/bam-readcount -q 5 -f /share/ref/GRCh38/ucsc/hg38.fa -l /SAN/colcc/IBD/whole_exome/ONTARGET/SNPBED/sort_matching.bed /SAN/colcc/IBD/whole_exome/finalbams/on_target${patient}.bam > ${patient}.pileup

cat ${patient}.pileup | awk '{print $5}' | cut -d: -f2 > ${patient}.one.txt
cat ${patient}.pileup | awk '{print $6}' | cut -d: -f2 > ${patient}.two.txt
cat ${patient}.pileup | awk '{print $7}' | cut -d: -f2 > ${patient}.three.txt
cat ${patient}.pileup | awk '{print $8}' | cut -d: -f2 > ${patient}.four.txt
cat ${patient}.pileup | awk '{print $9}' | cut -d: -f2 > ${patient}.five.txt
cat ${patient}.pileup | awk '{print $10}' | cut -d: -f2 > ${patient}.six.txt

awk '{print $1 "\t" $2 "\t" $3 "\t" $4}' ${patient}.pileup > ${patient}.out.out
paste -d'\t' ${patient}.out.out ${patient}.one.txt ${patient}.two.txt ${patient}.three.txt ${patient}.four.txt ${patient}.five.txt ${patient}.six.txt > ${patient}.processed.txt

rm ${patient}.one.txt
rm ${patient}.two.txt
rm ${patient}.three.txt
rm ${patient}.four.txt
rm ${patient}.five.txt
rm ${patient}.six.txt


