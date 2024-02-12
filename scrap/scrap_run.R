library(tidyverse)
library(runjags)
library(rjags)
#source("scrap/modified_model.R")
source("scrap/modified_model_processE.R")
initsall <- readRDS("scrap/inits.rds")

#data <- datalist
data$stock <- 1
run0 <- run.jags(WGBAST_model, monitor= parnames,
                 data=data,inits = initsall,
                 n.chains = 2, method = 'parallel', thin=1,
                 burnin =10000, modules = "mix",
                 sample =10, adapt = 10000,
                 keep.jags.files=F,#paste0(runName, assessment_year),
                 progress.bar=TRUE, jags.refresh=1)

sink(file = "scrap/failedJAGS.txt")
failed.jags()
sink()
