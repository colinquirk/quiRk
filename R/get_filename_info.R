get_filename_info = function(filename, pattern, simplify=T) {
  require(stringr)

  result = stringr::str_match(filename, pattern)[,-1]
  if (!simplify) {
    if (is.null(nrow(result))) {
      result = as.matrix(result)
    }
    result = lapply(seq_len(nrow(result)), function(i) result[i,])
  }
  result
}
