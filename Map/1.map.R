rm(list=ls())
options(stringsAsFactors = F)

library(png)

imgpng <- readPNG("./map2.png")
r <- nrow(imgpng)/ncol(imgpng)
par(mar=c(3,3,2,2))  #下左上右
plot(c(-180,180),c(-90,90),type = "n",xlab = "Longitude",
     ylab = "Latitude",cex.lab=1.5,font.lab=2,mgp=c(1.8,0.5,0),
     xaxs="i",yaxs="i",
     xaxt = "n", yaxt ="n",xlim = c(-10,150),ylim = c(-10,70))

rasterImage(imgpng,-180,-90,180,90)#图片及放置的两个对角线


axis(1,at=c(0,50,100,150),
     labels = c('0°','50°E','100°E','150°E'),
     mgp=c(0,0.5,0),cex.axis=1,outer = F)
axis(2,at=c(0,20,40,60),las=2,
     labels = c('0°','20°N','40°N','60°N'),cex.axis=1,
     mgp=c(0,0.5,0),outer = F)
