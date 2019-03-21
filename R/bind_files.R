bind_files = function(fp, ext="csv", find_id=F, pattern=NULL, .id=NULL) {
  require(quiRk)
  require(readr)

  if (find_id) {
    files = list.files(path = fp, pattern = paste0('*.', ext), full.names=T)
    dfs = lapply(files, read_csv)

    vals = quiRk::get_filename_info(files, pattern, simplify=F)
    dfs = quiRk::add_filename_info(dfs, .id, vals)
  } else if (!is.null(pattern)) {
    # If we aren't finding a subject number, just use pattern to select files
    files = list.files(path = fp, pattern = pattern, full.names=T)
    dfs = lapply(files, read_csv)
  } else {
    files = list.files(path = fp, pattern = paste0('*.', ext), full.names=T)
    dfs = lapply(files, read_csv)
  }

  dfs %>%
    bind_rows()
}
