source(file.path("functions.R"))
cliente <- read.csv(file=file.path("data", "client.csv"), sep=";")
cliente[,"birth_number"] <- sapply(cliente[,"birth_number"],as.character)
cliente["age"] <- sapply(1:nrow(cliente), getClientAge, data =cliente, currentYear = as.integer(format(Sys.Date(), "%Y")))
cliente["gender"] <- sapply(1:nrow(cliente), getClientGender, data = cliente)
cliente$birth_number <- NULL


