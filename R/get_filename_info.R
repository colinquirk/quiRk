get_filename_info = function(filename, pattern) {
  require(stringr)

  result = stringr::str_match(filename, pattern)[,-1]
  if (is.null(nrow(result))) {
    result = as.matrix(result)
  }
  lapply(seq_len(nrow(result)), function(i) result[i,])
}
