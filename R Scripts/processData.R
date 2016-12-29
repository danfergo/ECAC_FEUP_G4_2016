
source('~/ECAC_FEUP_G4_2016/R Scripts/proj_libs.R')

source('~/ECAC_FEUP_G4_2016/R Scripts/loadData.R')

source('~/ECAC_FEUP_G4_2016/R Scripts/functions.R')



#--------------------------------------- Account Handler ---------------------------------------

stats<-sapply(1:length(account), printStats, data = account)
colnames(stats) <- names(account)

createPlot("Account Missing Values", legendPlaceX = "topright")

#get account age
account[,"date"] <- sapply(account[,"date"],as.character)
account["account_age"] <- sapply(1:nrow(account), getAccountAge, data =account, currentYear = as.integer(format(Sys.Date(), "%Y")))

#remove date
account <- subset(account, select = -date)

#--------------------------------------- Client Handler ---------------------------------------

stats<-sapply(1:length(client), printStats, data = client)
colnames(stats) <- names(client)

createPlot("Client Missing Values", legendPlaceX = "topright")

#get age from birth
client[,"birth_number"] <- sapply(client[,"birth_number"],as.character)
client["client_age"] <- sapply(1:nrow(client), getClientAge, data =client, currentYear = as.integer(format(Sys.Date(), "%Y")))

#add gender and remove birth_number
client["gender"] <- sapply(1:nrow(client), getClientGender, data = client)
client <- subset(client, select = -birth_number)


#--------------------------------------- Disposition Handler ---------------------------------------

stats<-sapply(1:length(disposition), printStats, data = disposition)
colnames(stats) <- names(disposition)

createPlot("Disposition Missing Values", legendPlaceX = "topright")

#--------------------------------------- District Handler ---------------------------------------

cat("\n Filling District empty spaces with NA...\n")
length(district[district == "?"])
district[district == "?"] <- NA

stats<-sapply(1:length(district), printStats, data = district)
colnames(stats) <- names(district)

createPlot("District Missing Values", legendPlaceX = 62, legendPlaceY = 80)

district[,c("unemploymant.rate..95","no..of.commited.crimes..95")] <- 
  sapply(district[,c("unemploymant.rate..95","no..of.commited.crimes..95")],as.numeric)

cat("\n Filling District NAs with median...\n")
district$unemploymant.rate..95[is.na(district$unemploymant.rate..95)] <- median(district$unemploymant.rate..95, na.rm = TRUE)
district$no..of.commited.crimes..95[is.na(district$no..of.commited.crimes..95)] <- median(district$no..of.commited.crimes..95, na.rm = TRUE)

colnames(district)[1] <- "district_id"


#--------------------------------------- Loan Handler ---------------------------------------

stats<-sapply(1:length(loan), printStats, data = loan)
colnames(stats) <- names(loan)

createPlot("Loan Missing Values", legendPlaceX = 26, legendPlaceY = 700)

#--------------------------------------- Credit Card Handler ---------------------------------------

stats<-sapply(1:length(credit_card), printStats, data = credit_card)
colnames(stats) <- names(credit_card)

createPlot("Credit card Missing Values", legendPlaceX = 15, legendPlaceY = 900)

#--------------------------------------- Transactions Handler ---------------------------------------

stats<-sapply(1:length(transactions), printStats, data = transactions)
colnames(stats) <- names(transactions)

createPlot("Transactions Missing Values", legendPlaceX = "topright")


#--------------------------------------- Merges ---------------------------------------

#merge client with district worth
temp <- merge(client, district, by = "district_id")

#merge with disposition
temp <- merge(temp, disposition, by = "client_id")

#merge account
account <- subset(account, select = -district_id)
temp <- merge(temp, account, by = "account_id", all.x = TRUE)
temp <- temp[!temp$type=="DISPONENT",] #remover disponents
temp <- subset(temp, select = -type) #agora são todos owners

#merge loan
temp <- merge(temp, loan, by = "account_id", all.x = TRUE)
temp <- subset(temp, select = -loan_id)
temp <- subset(temp, select = -c(district_id, disp_id))

#merge transactions
cat("\nGetting transactions mean values...")
tempMeans <- subset(transactions,select = c(account_id,amount,balance))
means <- aggregate(.~account_id, data=tempMeans, mean)
colnames(means)[2] <- "Avg_amount"
colnames(means)[3] <- "Avg_balance"
temp <- merge(temp, means, by = "account_id", all.x = TRUE)

#remove NA's
final <- na.omit(temp)

#final print
stats<-sapply(1:length(temp), printStats, data = temp)
colnames(stats) <- names(temp)
createPlot("Temp Missing Values", legendPlaceX = "topright", legendPlaceY = 4500)
