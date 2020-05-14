## function ranking hospitals from lowest to highest rate of death
## for a given outcome across a given state 

rankhospital <- function(state, outcome, num = "best") {
    data <- read.csv("~/Documents/Data_Science/Courera_RData_Sci_Specialization/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    State_Name <- data[,7]
    Hospital <- data[, 2]
    Heart_Attack <- data[, 11]
    Heart_Failure <- data[, 17]
    Pneumonia <- data[, 23]
    
    df <- data.frame(State_Name, Hospital, Pneumonia, Heart_Attack, Heart_Failure, stringsAsFactors = F)
    colnames(df) <- c("state initials", "hospital", "pneumonia", "heart attack", "heart failure")
    
    '%!in%' <- function(x,y)!('%in%'(x,y))
    if (state %!in% data$State) {
        stop("invalid state")
    } else if (outcome %!in% c("pneumonia", "heart attack", "heart failure")) {
        stop ("invalid outcome")
    }
    
    newdf <- subset(df, df[ ,"state initials"] == state)
    if (outcome == "pneumonia") {
        colnum <- 3
    } else if (outcome == "heart attack") {
        colnum <- 4
    } else if (outcome == "heart failure") {
        colnum <- 5
    }
    
    newdf[, colnum] <- as.numeric(newdf[, colnum])
    newdf <- newdf[order(newdf[, colnum], newdf[, 2], na.last = NA), ]
    
    if (num == "best") {
        num <- 1
    } else if (num == "worst") {
        num <- nrow(newdf)
    }
    
    hospname <- newdf[num,2]
    return(hospname)
}

rankhospital("NY", "heart attack", 7)






