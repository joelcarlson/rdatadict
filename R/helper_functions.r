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