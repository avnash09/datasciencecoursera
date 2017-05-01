complete <- function(directory, id = 1:332) {
  nb <- numeric(0)
  for(i in id) {
    filename <- getfile(i,directory)
    filedata <- read.csv(filename)
    nb <- c(nb,nrow(na.omit(filedata)))
  }
  data.frame(id=id, nobs=nb)
}

getfile <- function(id,directory) {
  f<-paste(directory,"/",sprintf("%03d",id),".csv",sep = "")
  return(f)
}