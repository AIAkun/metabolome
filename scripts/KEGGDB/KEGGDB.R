# BiocManager::install("KEGGREST")
# BiocManager::install("fmcsR")
# install.packages("RbioRXN")
# BiocManager::install("RbioRXN",dependencies=TRUE, INSTALL_opts = c('--no-lock'))
# devtools::install_github("https://github.com/cran/RbioRXN.git")
# install.packages("RbioRXN_1.5.1.tar.gz",repos = NULL, type="source")
# devtools::install_local("RbioRXN_1.5.1.tar.gz")

##包加载
library(KEGGREST)
library(RbioRXN)
library(plyr)
##查看KEGG数据库包含的数据
listDatabases()
##获取单个数据集中的数据,
pathway<- keggList("pathway")
##对单个数据库进行组织的选择
org <-keggList("pathway","hsa")
##获取所有的代谢反应和化合物数据

keggAll = get.kegg.all()
save(keggAll,file="keggAll.Rdata")
# setwd('../../')
load('keggAll.Rdata')
###提取数据
reaction=keggAll$reaction
write.csv(reaction," reaction.csv")
compound=keggAll$compound
write.csv(compound," compound.csv")

head(reaction)
head(compound)
