#fun1---------------------------------------------------------------------------------------------------
#@param x = length of the data; data = data frame
#@return prints missing values and outputs data frame to target variable
printStats <- function(x, data){
  missNA<-sum(is.na(data[,x]))
  missVoid<-sum(data[,x] == "" & !is.na(data[,x])) #if data[,x] == "" -> returns NA
  cat(sprintf("\n---%s---\nNA count: %d --> %.2f%%\nEmpty count: %d --> %.2f%%\n",
              names(data)[x], missNA, 100*missNA/nrow(data), missVoid, 100*missVoid/nrow(data)))
  
  tempMatrix <- matrix(c(nrow(data)-missNA-missVoid, missNA, missVoid), nrow = 3, ncol = 1)
}

#fun2---------------------------------------------------------------------------------------------------
#@param name = name of the myBarMatrix data; legendPlaceX, legendPlaceY = coordinates for x or label
#@return prints missing values and outputs data frame to target variable
createPlot <- function(name, legendPlaceX, legendPlaceY){
  #make histogram
  colours <- c("red", "yellow", "blue")
  bplot <- barplot(stats, main=name, ylab = "Count", 
                   beside=TRUE, col=colours, las = 3,font.lab = 1, cex.lab = 0.8, cex.names = 0.7, bty='L')
  par(xpd=TRUE)
  legend(legendPlaceX, legendPlaceY, c("Value","NA","Empty"), bty="n", fill=colours,  cex = 0.6)
}

#fun3---------------------------------------------------------------------------------------------------
#@param x = length of the data; data = data frame(account); currentYear = System variable(year)
#@return value of account age if data is pre year 2000
getAccountAge <- function(x, data, currentYear){
  tempAgeVect <- unlist(strsplit(data$date[x], ""))
  tempAgeVect <- paste(tempAgeVect[1:2], collapse = "")
  temp <- c("19", tempAgeVect)
  tempAgeVect <- paste(temp, collapse = "")
  TempAge <- currentYear-as.numeric(tempAgeVect)
}

#fun4---------------------------------------------------------------------------------------------------
#@param x = length of the data; data = data frame(client); currentYear = System variable(year)
#@return value of client age if data is pre year 2000
getClientAge <- function(x, data, currentYear){
  tempAgeVect <- unlist(strsplit(data$birth_number[x], ""))
  tempAgeVect <- paste(tempAgeVect[1:2], collapse = "")
  temp <- c("19", tempAgeVect)
  tempAgeVect <- paste(temp, collapse = "")
  TempAge <- currentYear-as.numeric(tempAgeVect)
}

#fun5---------------------------------------------------------------------------------------------------
#@param x = length of the data; data = data frame(client);
#@return gender of client 
getClientGender <- function(x, data){
  tempGenderVect <- unlist(strsplit(data$birth_number[x], ""))
  tempGenderVect <- paste(tempGenderVect[3:4], collapse = "")
  tempGender <- c(tempGenderVect)
  tempGenderVect <- paste(tempGender, collapse = "")
  Gender <- if(tempGenderVect > 12) {"F"} else {"M"}
}
