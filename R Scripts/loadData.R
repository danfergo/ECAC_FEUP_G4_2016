#Load data
cat("Loading files...\n")

account <- read.csv("~/ECAC_FEUP_G4_2016/data/account.csv", sep=";")
cat("account done\n")
client <- read.csv("~/ECAC_FEUP_G4_2016/data/client.csv", sep=";")
cat("client done\n")
disposition <- read.csv("~/ECAC_FEUP_G4_2016/data/disp.csv", sep=";")
cat("disposition done\n")
credit_card <- read.csv("~/ECAC_FEUP_G4_2016/data/card_train.csv", sep=";")
cat("credit_card done\n")
loan <- read.csv("~/ECAC_FEUP_G4_2016/data/loan_train.csv", sep=";")
cat("loan done\n")
district <- read.csv("~/ECAC_FEUP_G4_2016/data/district.csv", sep=";")
cat("district done\n")
transactions <- read.csv("~/ECAC_FEUP_G4_2016/data/trans_train.csv", sep=";")
cat("transactions done\n")



summary(account)
describe(account)
str(account)

summary(client)
describe(client)
str(client)

summary(disposition)
describe(disposition)
str(disposition)

summary(credit_card)
describe(credit_card)
str(credit_card)

summary(loan)
describe(loan)
str(loan)

summary(credit_card)
describe(credit_card)
str(credit_card)

summary(district) #tem valores com "?"
describe(district)
str(district)

summary(transactions)
describe(transactions)
str(transactions)
