# This function will be the core of the data dict
# We want it to:
# Given nothing, to initialize a datadict and prompt the user to enter a variable name and desc.
# Given a dataframe, intitalizae a datadict, and prompt the user to enter descriptionbs of column names not in the dictionary

data_dict <- function(x=NULL){
  if(is.data.frame(x) & !"data_dict" %in% class(x)){
    return(colnames(x))
  } else if ("data_dict" %in% class(x)){
    print("You've got yourself a dictionary!")
  } else {
    print("Let's create a dictionary!")
    dict <- data.frame("Variable" = character(), "Description" = character(), stringsAsFactors=FALSE)
    item_count <- length(dict[,1]) + 1
    
    
    #Prompt user for information until they request to stop
    while(TRUE){
      # Input var name and description
      var_name = readline( prompt = "Enter a variable name: " )
      
      # If the variable is within the dict prompt user
      if ( ! var_in_dict_okay( var_name, dict ) ){ next }
      
      var_desc = readline( prompt = "Enter the description of the variable: " ) 
      
      #Confirm that the entry is acceptable, if not, delete and start again
      if( ! ask_question(paste("\nIs this okay?\n",
                               var_name, " : ", var_desc, 
                               "\n\nYes [Return], No [N]: ")) ) {
        
        print( paste0( "[", var_name, "] NOT added to dictionary!" ) )
        
        # If entry is alright add to dict
      } else {
        dict[ item_count, ] <- c( var_name, var_desc )
        item_count <- item_count + 1
        print( paste0( "[", var_name, "] added to dictionary!" ) )
      }
      
      # Prompt user to add another entry
      if( ! ask_question() ){
        break
      }
      
    }
    class(dict) <- c("data.frame","data_dict")
    return(dict)
  }
  
}

ask_question <- function(prompt = "\nWould you like to enter another item?\n Yes [Return], No [N]: " ){
  get_answer <- readline( prompt )
  # If the answer is a negative response, return False. 
  # Otherwise assume the answer was positive
  ifelse(get_answer %in% c("N", "No", "n", "no"), FALSE, TRUE)  
}

var_in_dict_okay <- function(var_name, dictionary){
  if( var_name %in% dictionary[ , 1] ){
    if( ! ask_question( paste( "[", var_name, "] is already contained in the dictionary. Continue?\n Yes [Return], No [N]: " ) ) ){
      return(FALSE)
    } 
  }
  return(TRUE)
}

if("dat_dict" %in% class(z)){
  print("Cool!")
}