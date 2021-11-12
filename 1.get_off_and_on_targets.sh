#OFF TARGET
/share/apps/genomics/bedtools-2.25.0/bin/bedtools intersect -abam /SAN/colcc/IBD/whole_exome/finalbams/${patient}.bam -b /SAN/colcc/IBD/whole_exome/PureCN/Nonacus_Exome_GRCh38.bed -v > /SAN/colcc/IBD/whole_exome/finalbams/off_target${patient}.bam

#ON TARGET
/share/apps/genomics/bedtools-2.25.0/bin/bedtools intersect -abam /SAN/colcc/IBD/whole_exome/finalbams/${patient}.bam -b /SAN/colcc/IBD/whole_exome/PureCN/Nonacus_Exome_GRCh38.bed > /SAN/colcc/IBD/whole_exome/finalbams/on_target${patient}.bam

