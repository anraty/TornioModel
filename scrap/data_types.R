#   making a function to select specific sub stock needed data for the model to run

#   df to see different names and dimension
dims = lapply(datalist, dim)

d <- c()

for(i in 1:length(dims)){
  
  # d1 <- c(d1, ifelse(dims[[i]][1] %>% is.null(), NA, dims[[i]][1]))
  # d2 <- c(d2, ifelse(dims[[i]][2] %>% is.null(), NA, dims[[i]][2]))
  # d3 <- c(d3, ifelse(dims[[i]][3] %>% is.null(), NA, dims[[i]][3]))

  d1 <- dims[[i]][1]
  d2 <- dims[[i]][2]
  d3 <- dims[[i]][3]
  
  d1 <- ifelse(is.null(d1)||is.na(d1), length(datalist[[i]]), d1)
  d2 <- ifelse(is.null(d2)||is.na(d2), 0, d2)
  d3 <- ifelse(is.null(d3)||is.na(d3), 0, d3)
  
  ds <- c(d1, d2, d3)

  d <- rbind(d, ds)
  
  

  
}


nam_dim <- data.frame(
  names = names(datalist),
  d1 = d[,1],
  d2 = d[,2],
  d3 = d[,3]

)

nam_dim %>% 
  mutate(
    d1_desc = 
      case_when(
        d1 == 17 ~ "stocks",
        d1 == 15 ~ "stocks",
        d1 > 17  ~ "years",
        d1 == 6  ~ "age",
        d1 == 1  ~ "integer",
        d1 == 4  ~ "AU",
        d1 == 2  ~ "r-stocks",
        d1 == 0 ~ ""
        
    ),
    d2_desc = 
      case_when(
        d2 == 17 ~ "stocks",
        d2 > 17  ~ "years",
        d2 == 6  ~ "age",
        d2 == 1  ~ "integer",
        d2 == 4  ~ "AU",
        d2 == 2  ~ "r-stocks",
        d2 == 0 ~ ""
        
      ),
    d3_desc = 
      case_when(
        d3 == 17 ~ "stocks",
        d3 > 17  ~ "years",
        d3 == 6  ~ "age",
        d3 == 1  ~ "integer",
        d3 == 4  ~ "AU",
        d3 == 3  ~ "AU",
        d3 == 0 ~ ""
        
      )
    
  )




datalist$muTemp %>% length







#   loop for selecting one stock
dm <- datalist
for(i in 1:length(datalist)){
  d <- dm[[i]]
  dims <- dim(d)
  ndims <- length(dims)
  if(17 %in% dims){
    #   which has 17 indexes
    index <- which(dims==17)
    #ind = list()
    ind <- c()
    for(j in 1:ndims){
      if(j == index){
        #ind[[i]] = 1
        ind = cbind(ind,c(1))
      }
      else{
        #ind[[i]] = 1:dims[i]
        ind = cbind(ind,1:dims[j])
      }
    }
    #   select the correct
    dm[[i]] <- d[ind]
    
   
     

  }
}


