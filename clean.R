
clean_data <- raw_data


readStates <- function(states)
{
    states <- states[-1,]
    num.row<- nrow(states)
    states<- states[-num.row,]
    
    states<- states[,-1:-4]
    
    colnames(states)<-c("stateName", "population", "popOver18","percentOver18")
    return(states)
}

cleanCensus <- readStates(raw_data)
str(cleanCensus)

