bgzip 4pop.recode.vcf
tabix 4pop.recode.vcf.gz

for j in {1..19}
do
  sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest vcf2smc ./4pop.recode.vcf.gz ./KA/KA-chr${j}.smc.gz $j KA:KA1,KA2,KA5,KA6
done
sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest estimate --spline cubic --knots 15 --timepoints 100 10000000 --cores 20  -o ./KA/estimate1/ 4.1e-9 ./KA/KA-*.smc.gz

sudo docker run --rm -v $PWD:/mnt terhorst/smcpp:latest plot ./total.pdf ./*/estimate1/*.final.json -g 1 --ylim 0 10000000 --xlim 100 1000000 -c