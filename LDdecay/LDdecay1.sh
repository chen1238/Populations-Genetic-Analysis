for i in CAS1 CAS2 DOM MUS
do
    ./popLDdecay/bin/PopLDdecay  -InVCF  ../4pop.recode.vcf \
    -SubPop $i.txt -MaxDist 500 -OutStat ./output/$i -Miss 0.05 -MAF 0.05
done

cd ./LD
perl ../popLDdecay/bin/Plot_MultiPop.pl -inList ./file.txt -bin1 100 -bin2 300  -break 300 -output ./LDdecay -maxX 500
tar zcfv ./LD.tar.gz ./LDdecay*
cd ..

