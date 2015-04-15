add_new_entry <- function(dict, var_name=NULL){
  item_count <- length(dict[,1]) + 1

  # Input var name and description
  if(is.null(var_name)){
      var_name = readline( prompt = "Enter a variable name: " )
      
      # If the variable is within the dict prompt user
      if ( ! var_in_dict_okay( var_name, dict ) ){ next }
  }

    
  var_desc = readline( prompt = paste("Enter a description for [", var_name, "]: " ) )
    
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
    
  return(dict)
}