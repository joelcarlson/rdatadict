new_entry_from_df <- function(df){
  dict <- new_dict()
  for(var_name in colnames(df)){
    dict <- add_new_entry(dict, var_name)
  }
  return(dict)
}