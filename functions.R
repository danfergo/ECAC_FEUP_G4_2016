#fun1---------------------------------------------------------------------------------------------------
#@param x = length of the data; data = data frame(client); currentYear = System variable(year)
#@return value of client age if data is pre year 2000
getClientAge <- function(x, data, currentYear){
  tempAgeVect <- unlist(strsplit(data$birth_number[x], ""))
  tempAgeVect <- paste(tempAgeVect[1:2], collapse = "")
  temp <- c("19", tempAgeVect)
  tempAgeVect <- paste(temp, collapse = "")
  TempAge <- currentYear-as.numeric(tempAgeVect)
}

#fun2---------------------------------------------------------------------------------------------------
#@param x = length of the data; data = data frame(client);
#@return gender of client 
getClientGender <- function(x, data){
  tempGenderVect <- unlist(strsplit(data$birth_number[x], ""))
  tempGenderVect <- paste(tempGenderVect[3:4], collapse = "")
  tempGender <- c(tempGenderVect)
  tempGenderVect <- paste(tempGender, collapse = "")
  Gender <- if(tempGenderVect > 12) {"F"} else {"M"}
}