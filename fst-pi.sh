vcftools --vcf ../4pop.recode.vcf --weir-fst-pop CAS1.txt --weir-fst-pop CAS2.txt \
--fst-window-size 100000 --out CAS1-CAS2

for i in {CAS1,CAS2,DOM,MUS}
do 
    vcftools --vcf ../4pop.recode.vcf --keep $i.txt  --window-pi 100000  --out $i 
done
tar zcfv pi.100k.tar.gz *.pi
