corr <- function(directory, threshold = 0) {
  ncobs <- complete("specdata")
  data <- numeric(332)
  k <- 1
  for(i in 1:332){
    if(ncobs[i,"nobs"] > threshold){
      if(i >=1 && i <=9) {
        j<- paste("00",i,sep = "")
      } else if (i >=10 && i <= 99) {
        j<- paste("0",i,sep = "")
      } else j <- i
      f <- paste(file.path(directory,j),"csv",sep = ".")
      a <- read.csv(f)
      data[k] <- cor(a$nitrate,a$sulfate, use = "complete.obs")
      k <- k + 1
      #if(k ==1) df<-rbind(a)
      #else df<-rbind(df,a)
      #k<-2
      } 
  }
  #df_gb<-group_by(df,ID) 
  #dfsum<-summarize(df,Cor=cor(sulfate,nitrate,use = "complete.obs"))
  #dfsum<-select(dfsum,Cor)  
  #dfsum<-filter(dfsum,is.na(Cor)==FALSE)
  #return(dfsum$Cor)  
  data
}