pollutantmean <- function(directory, pollutant, id = 1:332) {
  means <- 0
  summ <- 0
  nr <- 0
  for(i in id){
    if(i>= 1 && i<=9){
      i <- paste("00",i,sep="")
    } else if (i >= 10 && i <= 99){
      i <- paste("0",i,sep = "")
    }
    f<-paste(file.path(directory,i),"csv",sep=".")
    a<-read.csv(f)
    summ <- summ + sum(a[,pollutant], na.rm = TRUE)
    nr <- nr + sum(!is.na(a[,pollutant]))
  }
  summ/nr
}