add_filename_info = function(df, .id, val) {
  for (i in 1:length(df)) {
    df[[i]][.id] = as.list(val[[i]])
  }
  df
}