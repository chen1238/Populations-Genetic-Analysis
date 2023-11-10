#depth >18

#index for reference fa
samtools faidx mm10.fa

#
bcftools mpileup -C 50 -Ou -I -f mm10.fa ./xxx.sort.rmdup.bam --threads 16 | bcftools call -c -Ov --threads 16 | ./vcfutils.pl vcf2fq -d 10 -D 100 | gzip > dilpoid.fq.gz


#input file of PSMC
../psmc-master/utils/fq2psmcfa -q20 dilpoid.fq.gz > output.psmcfa

#run PSMC
../psmc-master/psmc -N25 -t15 -r5 -p "4+25*2+4+6" -o output.psmc output.psmcfa

#bootstrap
../psmc-master/utils/splitfa output.psmcfa > split.psmcfa
for i in {1..100}
do 
	../psmc-master/psmc -b -p "4+25*2+4+6" -t15 -N25 -r5 -o round${i}.psmc split.psmcfa
done

#merge
cat output.psmc round*.psmc >combine.psmc


##9 plot 
#sudo apt install gnuplot-x11
#sudo apt-get install texlive-font-utils
perl ../psmc/psmc-master/utils/psmc_plot.pl -u 4.1e-9 -g 1 -R -p out_plot output.psmc 

#1.5 genarations per year
#0.76 year per genaration
#years = genarations * 0.76
