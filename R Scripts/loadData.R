#Load data
cat("Loading files...\n")

account <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\account.csv", sep=";")
cat("account done\n")
client <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\client.csv", sep=";")
cat("client done\n")
disposition <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\disp.csv", sep=";")
cat("disposition done\n")
#payment_order <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\banking.csv", header =TRUE)
#cat("payment_order done\n")
loan <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\loan_train.csv", sep=";")
cat("loan done\n")
#credit_card <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\banking.csv", header =TRUE)
#cat("credit_card done\n")
district <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\Data Set\\district.csv", sep=";")
cat("district done\n")
#transactions <- read.csv("C:\\Users\\Luis\\Documents\\Faculdade\\5o ano\\1o semestre\\ECAC\\Projeto\\banking - transaction_new.csv", header =TRUE)
#cat("transactions done\n")

summary(account)
describe(account)
str(account)

summary(client)
describe(client)
str(client)

summary(disposition)
describe(disposition)
str(disposition)

#summary(payment_order)
#describe(payment_order)
#str(payment_order)

#summary(loan)
#describe(loan)
#str(loan)

#summary(credit_card)
#describe(credit_card)
#str(credit_card)

summary(district) #tem valores com "?"
describe(district)
str(district)

#summary(transactions)
#describe(transactions)
#str(transactions)

