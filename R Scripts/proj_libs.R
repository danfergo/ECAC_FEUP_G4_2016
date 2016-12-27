# psych para o describe
#update.packages(checkBuilt=TRUE, ask=FALSE)

#install packages

# install.packages('caret')
# install.packages("psych")
# install.packages("mice")
# install.packages('Hmisc')#pag64 livro
# install.packages("VIM")
# install.packages("lattice")
# install.packages("ggplot2")
# install.packages("XLConnect")
# install.packages("rJava")
# install.packages("gdata")
# install.packages("xlsx")
# install.packages('rJava', .libPaths()[1])
# install.packages("xlsxjars")
# install.packages("gridBase")
# install.packages("fpc", dependencies = TRUE) #DBSCAN
# install.packages('compare')
# install.packages('devtools')
# devtools::install_github("kassambara/factoextra")
# install.packages('cluster')
# install.packages('ggdendro')
# install.packages('DAAG') #cross validation
# install.packages('rpart') #regression tree
# install.packages('party') #ctree
# install.packages('tree')
# install.packages('DMwR')
# install.packages('randomForest')
# install.packages('gbm')
# install.packages('pROC')
# install.packages('arules')
# install.packages('arulesViz')
#-------------------------------
#Load libs
#
library('lattice')
library('psych')
library('devtools')

library('mice')
library('ggplot2')
library('VIM')
library('car')
library('Hmisc')

#library('XLConnect')
#library('gdata')

#if (Sys.getenv("JAVA_HOME")!="")
#  Sys.setenv(JAVA_HOME="")
library('rJava')

library('xlsxjars')
library('xlsx')
#library('gridBase')


library('fpc')#DBSCAN e +
library('compare')

library('factoextra')
library('cluster')
library('graphics')
library('utils')

library('ggdendro')

library('Hmisc')

library('DAAG') #cross validation
library('rpart') #regression tree


library('party') #ctree
library('DMwR') #prettyTree

library('tree')
library('caret')
library('randomForest')
library('gbm')
library('pROC')

#association rules
library('arules')
library('arulesViz')

