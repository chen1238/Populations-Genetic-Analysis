File=treemix
clust=population.txt
vcftools --vcf /media/rui/Huang/Z840-20210805/passvcf/0827.vcf --max-missing 1 --keep KEEP.txt --recode --out ${File}
bgzip ${File}.recode.vcf
#LD filter
chmod +x ./ldPruning.sh
./ldPruning.sh ${File}.recode.vcf
#convert vcf file to treemix input file
#used python2
./vcf2treemix.sh ${File}.recode.LDpruned.vcf.gz $clust
#run treemix
for i in {0..5}
do
    for j in {1..5}
    do
        treemix -i ./treemix.recode.LDpruned.treemix.frq.gz -m $i -o ./result/${File}-$i-$j -noss -bootstrap -k 500 -root SPR
    done
done