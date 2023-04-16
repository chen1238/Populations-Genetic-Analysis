There are many R script, Python script and linux script of population genetics analysis.

Note: The script is not checked, please point out if there is a problem.


scripts:

merge-windows.R #use to merge consecutive windows

source('merge-windows.R')

Merger(data,2,3)

#input file

chr1 100 150

chr1 120 170

#result

chr1 100 170

#################################
Known regions seek genes

input format:

chr1  100 500

chr2  100 300

chr9  500 2500

bash 1.sh #(./Findgene/) Mm.position; 1.sh; input.txt

#################################

TREEMIX:treemix.sh

PSMC:PSMC.sh

SMC++:smc++.sh

FST-PI:fst-pi.sh

Dsuite:Dsuite.sh
