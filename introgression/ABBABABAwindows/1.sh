#format
python ../VCF_processing/parseVCF.py -i cas.recode.vcf |bgzip > cas.geno.gz
#ABBABABA-D
python ../ABBABABAwindows.py -g ./cas.geno.gz -f phased -o cas.csv -w 100000 -s 20000 -m 100 -T 10 -P1 c -P2 h -P3 m -O o --popsFile cas.txt --writeFailedWindows 
#fst,dxy
python ../popgenWindows.py -g ./cas.geno.gz -f phased -o cas-pop.csv -w 100000 -s 20000 -m 100 -T 10 -p c -p h -p m -p o --popsFile cas.txt --writeFailedWindows 
