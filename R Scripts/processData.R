
source('~/ECAC_FEUP_G4_2016/R Scripts/proj_libs.R')

source('~/ECAC_FEUP_G4_2016/R Scripts/loadData.R')

source('~/ECAC_FEUP_G4_2016/R Scripts/functions.R')

#source('~/Faculdade/5o ano/1o semestre/ECAC/Projeto/R Scripts/missingValues.R')



#source("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\R Scripts\\functions.R")
#client<- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\client.csv", sep=";")

#--------------------------------------- Account Handler ---------------------------------------
myBarMatrix<-sapply(1:length(account), printEmptyVal, data = account)
colnames(myBarMatrix) <- names(account)

createBarPlot("Account Missing Values", legendPlaceX = "topright")

#get account age
account[,"date"] <- sapply(account[,"date"],as.character)
account["account_age"] <- sapply(1:nrow(account), getAccountAge, data =account, currentYear = as.integer(format(Sys.Date(), "%Y")))

#remove date
account <- subset(account, select = -date)

#--------------------------------------- Client Handler ---------------------------------------

cliStats<-sapply(1:length(client), printEmptyVal, data = client)
colnames(cliStats) <- names(client)

createBarPlot("Client Missing Values", legendPlaceX = "topright")

#get age from birth
client[,"birth_number"] <- sapply(client[,"birth_number"],as.character)
client["client_age"] <- sapply(1:nrow(client), getClientAge, data =client, currentYear = as.integer(format(Sys.Date(), "%Y")))

#add gender and remove birth_number
client["gender"] <- sapply(1:nrow(client), getClientGender, data = client)
client <- subset(client, select = -birth_number)

#client[,"birth_number"] <- sapply(client[,"birth_number"],as.character)
#client["age"] <- sapply(1:nrow(client), getClientAge, data =client, currentYear = as.integer(format(Sys.Date(), "%Y")))
#client["gender"] <- sapply(1:nrow(client), getClientGender, data = client)
#client$birth_number <- NULL

#--------------------------------------- Disposition Handler ---------------------------------------
dispStats<-sapply(1:length(disposition), printEmptyVal, data = disposition)
colnames(dispStats) <- names(disposition)

createBarPlot("Disposition Missing Values", legendPlaceX = 15, legendPlaceY = 6000)

#--------------------------------------- District Handler ---------------------------------------
cat("\nFilling District empty spaces with NA...\n")
length(district[district == "?"])
district[district == "?"] <- NA

distStats<-sapply(1:length(district), printEmptyVal, data = district)
colnames(distStats) <- names(district)

createBarPlot("District Missing Values", legendPlaceX = 62, legendPlaceY = 80)

district[,c("unemploymant.rate..95","no..of.commited.crimes..95")] <- 
  sapply(district[,c("unemploymant.rate..95","no..of.commited.crimes..95")],as.numeric)

cat("\nFilling District NAs with median...\n")
district$unemploymant.rate..95[is.na(district$unemploymant.rate..95)] <- median(district$unemploymant.rate..95, na.rm = TRUE)
district$no..of.commited.crimes..95[is.na(district$no..of.commited.crimes..95)] <- median(district$no..of.commited.crimes..95, na.rm = TRUE)

colnames(district)[1] <- "district_id"


#merge client with district worth
temp <- merge(client, district, by = "district_id")

#merge with disposition
temp <- merge(temp, disposition, by = "client_id")

#---------------------------------------------------------------------------------------------
#credit card não usado para descrever client
#temp <- merge(temp, credit_card, by = "disp_id", all.x = TRUE)

#---------------------------------------------------------------------------------------------
#merge account

account <- subset(account, select = -district_id)

temp <- merge(temp, account, by = "account_id", all.x = TRUE)

temp <- temp[!temp$type=="DISPONENT",] #remover disponents
temp <- subset(temp, select = -type) #agora são todos owners

#merge loan
temp <- merge(temp, loan, by = "account_id", all.x = TRUE)
temp <- subset(temp, select = -loan_id)

#---------------------------------------------------------------------------------------
#trim de variaveis não interessantes
temp <- subset(temp, select = -c(district_id, disp_id))

#merge transactions-------------------------------------------------------------

cat("\nGetting transactions mean values...")
tempMeans <- subset(transactions,select = c(account_id,amount,balance))
means <- aggregate(.~account_id, data=tempMeans, mean)
colnames(means)[2] <- "Avg_amount"

#meanAmount <- tapply(transactions$amount, transactions$account_id, mean)
#meanBalance <- tapply(transactions$balance, transactions$account_id, mean)
#means <- cbind(meanAmount,meanBalance)

temp <- merge(temp, means, by = "account_id", all.x = TRUE)

#---------------------------------------------------------------------------------------
#trim de variaveis não interessantes
#temp <- subset(temp, select = -c(account_id, client_id))