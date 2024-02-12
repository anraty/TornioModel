source("scrap/modified_model.R")
data <- datalist
data$stock <- 1
run0 <- run.jags(WGBAST_model, monitor= parnames,
                 data=data,#inits = initsall,
                 n.chains = 2, method = 'parallel', thin=1,
                 burnin =10000, modules = "mix",
                 sample =10, adapt = 10000,
                 keep.jags.files=F,#paste0(runName, assessment_year),
                 progress.bar=TRUE, jags.refresh=1)
