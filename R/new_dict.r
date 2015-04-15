new_dict <- function(){   
    #initialize the new dictionary
    print( "New data_dict initialized")
    dict <- data.frame("Variable" = character(), "Description" = character(), stringsAsFactors=FALSE)
    class(dict) <- c("data.frame","data_dict")
    return(dict)
    
}    