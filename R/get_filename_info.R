get_filename_info = function(fp, pattern) {
  require(stringr)

  result = stringr::str_match(fp, pattern)[,-1]
  lapply(seq_len(nrow(result)), function(i) result[i,])
}