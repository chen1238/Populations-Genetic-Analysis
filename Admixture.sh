plink --vcf 4pop.recode.vcf --make-bed --out 4pop --allow-extra-chr

for k in {2..6}
do 
    admixture --cv 4pop.bed $k -j10 | tee log0828-${k}.out
done
