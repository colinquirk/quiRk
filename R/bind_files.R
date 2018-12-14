bind_files = function(fp, ext="csv", find_id=F, pattern=NULL, .id=NULL) {
  require(quiRk)
  require(readr)

  files = list.files(path = fp, pattern = paste0('*.', ext), full.names=T)

  dfs = lapply(files, read_csv)

  if (find_id) {
    vals = quiRk::get_filename_info(files, pattern)
    dfs = quiRk::add_filename_info(dfs, .id, vals)
  }

  dfs %>%
    bind_rows()
}
