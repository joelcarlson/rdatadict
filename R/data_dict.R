data_dict <- function(dict=NULL){
  if(is.null(dict)){ 
    print("Let's make a dictionary!")
    # Run method for new_dict
    dict <- new_dict()
    dict <- add_new_entry(dict)
    
  } else if ("data_dict" %in% class(dict)){
    print("You've got yourself a dictionary!")
    print("Add new entries!")
    dict <- add_new_entry(dict)
    
  
  } else if (is.data.frame(dict)) {
    print("It's a dataframe! Let's dictionarize it!")
    dict <- new_entry_from_df(dict)
    
  } else {
    print("Whatever you entered, it was wrong")
    # Get user out of here!
    
  }
}



