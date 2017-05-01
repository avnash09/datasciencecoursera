complete <- function(directory, id = 1:332) {
  
  len <- length(id)
  cnt <- 1
  x <- numeric(len)
  y <- numeric(len)
  for(i in id) {
    if(i >=1 && i <=9) {
      j<- paste("00",i,sep = "")
    } else if (i >=10 && i <= 99) {
      j<- paste("0",i,sep = "")
    } else j <- i
    f <- paste(file.path(directory,j),"csv",sep = ".")
    a <- read.csv(f)
    x[cnt] <- i
    #y[cnt] <- nrow(na.omit(a))
    y[cnt] <- sum(complete.cases(a))
    cnt <- cnt + 1
  }
  data <- data.frame(id=x, nobs=y)
  data
}