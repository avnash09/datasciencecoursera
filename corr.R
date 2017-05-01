corr <- function(directory, threshold = 0) {
  ccdata <- complete("specdata")
  ccdata <- ccdata[ccdata$nobs > threshold,]
  corrdata <- numeric(0)
  
  for(i in ccdata$id) {
    filename <- getfile(i, directory)
    df <- read.csv(filename)
    corrdata <- c(corrdata, cor(df$sulfate,df$nitrate,use = "pairwise.complete.obs"))
  }
  return(corrdata)
}

getfile <- function(id,directory) {
  f<-paste(directory,"/",sprintf("%03d",id),".csv",sep = "")
  return(f)
}