pollutantmean <- function(directory, pollutant, id = 1:332) {
  summ <- numeric(0)
  nr <- numeric(0)
  for(i in id){
    filename <- getfile(i,directory)
    a<-read.csv(filename)
    #summ <- summ + sum(a[,pollutant], na.rm = TRUE)
    summ <- c(summ, sum(a$pollutant, na.rm = TRUE))
    #nr <- nr + sum(!is.na(a$pollutant))
    nr <- c(nr,sum(a[!is.na(a$pollutant),]))
  }
  return(summ/nr)
}

getfile <- function(id,directory) {
  f<-paste(directory,"/",sprintf("%03d",id),".csv",sep = "")
  return(f)
}