rm(list = ls())

#Merger(data,2,3)
# 第一列 chr1-chr19 第二列start 第三列end
Merger=function(df,x,y){
  a=df[df$V1=='chr1',]  #先处理染色体1，用于后续染色体合并，X染色体则需要自行修改
  a=a[order(a$V2),]     #排序，如果乱序则影响来来for循环连续判断
  i=1
  while (i<nrow(a)) {
    for (j in (i+1):nrow(a)) { #一致寻找重叠窗口，直到遇到不重叠窗口
      if((a[j,x]-1)<=a[i,y]){  #减1是因为start一般1结尾，end一般0结尾,看情况改变
        a[i,y]=a[j,y]
        a[j,x]=NA
      }else{
        break
      }
      
    }
    i=j
  }
  a1=na.omit(a)
  
  for (i in 2:19) {
    a=df[df$V1==paste0('chr',i),]  #先处理染色体1，用于后续染色体合并
    a=a[order(a$V2),]
    i=1
    while (i<nrow(a)) {
      for (j in (i+1):nrow(a)) { #一致寻找重叠，知道遇到不重叠窗口
        if((a[j,x]-1)<=a[i,y]){
          a[i,y]=a[j,y]
          a[j,x]=NA
        }else{
          break
        }
        
      }
      i=j
    }
    a=na.omit(a)
    a1=rbind(a1,a)
  }

  return(a1)
}


