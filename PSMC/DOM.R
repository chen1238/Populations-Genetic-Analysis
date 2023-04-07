rm(list=ls())
options(stringsAsFactors = F)

pdf(file = 'DOM.pdf',height = 6,width = 9)
#########AF
AFNAME=list.files(pattern = 'GER',path = './source')
AF=read.table(paste0('./source/',AFNAME[1]),header = F,stringsAsFactors = F)[,1:2]
colnames(AF)=c('year','population')


plot(AF$year/10000,AF$population,xlim=c(1,500),ylim=c(0,100),
     log="x",type="n",lwd="3",xlab="",ylab="",axes=F,cex.main=1.75,
     xaxs = "i", yaxs ="i")

axis(1,at=c(1:9,seq(10,100,10),200,300,400,500),
     labels =c(expression(10^4),rep('',8),
               expression(10^5),rep('',8),expression(10^6),rep('',4)),cex.axis=1,mgp=c(0,0.5,0))
axis(2,at=seq(0,100,20),labels =seq(0,100,20),cex.axis=1,mgp=c(0,0.5,0))



###############FA
FANAME=list.files(pattern = 'FA',path = './source')
FA=list()

for (i in 1:length(FANAME)) {
  FA[[i]]=read.table(paste0('./source/',FANAME[i]),header = F,stringsAsFactors = F)[,1:2]
  colnames(FA[[i]])=c('year','population')
  FA[[i]]$year=FA[[i]]$year/1.5
}
Col=rainbow(20)
for (i in 1:length(FANAME)) {
  lines(FA[[i]]$year/10000,FA[[i]]$population,
        type="s",lwd=1,col=Col[i])
}


######GER
GERNAME=list.files(pattern = 'GER',path = './source')
GERNAME=GERNAME[-c(2,3,11)]
GER=list()

for (i in 1:length(GERNAME)) {
  GER[[i]]=read.table(paste0('./source/',GERNAME[i]),header = F,stringsAsFactors = F)[,1:2]
  colnames(GER[[i]])=c('year','population')
  GER[[i]]$year=GER[[i]]$year/1.5
}
for (i in 1:length(GERNAME)) {
  lines(GER[[i]]$year/10000,GER[[i]]$population,
        type="s",lwd=1,col=Col[i+6])
}

##########IR
IRNAME=list.files(pattern = 'IR',path = './source')
IR=list()

for (i in 2:length(IRNAME)) {
  IR[[i]]=read.table(paste0('./source/',IRNAME[i]),header = F,stringsAsFactors = F)[,1:2]
  colnames(IR[[i]])=c('year','population')
  IR[[i]]$year=IR[[i]]$year/1.5
}
for (i in 1:length(IRNAME)) {
  lines(IR[[i]]$year/10000,IR[[i]]$population,
        type="s",lwd=1,col=Col[i+14])
}


rect(0.1,95,1.17,100, col=scales::alpha('#deb92b', 0.4))#,border="transparent"
rect(1.17,95,258.8,100, col=scales::alpha('green', 0.4))
rect(258.8,95,500,100, col=scales::alpha('red', 0.4))

text(0.35,97,labels='Holocene',cex=1,font=2)
text(17,97,labels='Pleistocene',cex=1,font=2)
text(370,97,labels='Pliocene',cex=1,font=2)


mtext(expression(Years("1.5 generations per year", mu==4.1%*%10^-9 )), 
      side = 1,line = 1.5,las = 1, col = "black",cex=1.2,padj =0.3)
mtext(expression("Effective population size "(x10^4 )), 
      side = 2,line = 1.5,las =0, col = "black",cex=1.2)

legend(85,95,legend=gsub('.txt','',c(FANAME,GERNAME,IRNAME)),col = Col,
       lty=1,lwd=2,bty='n',cex=1,ncol = 2)


box()
dev.off()