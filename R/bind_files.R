bind_files = function(fp, ext="csv", find_id=F, pattern=NULL, .id=NULL, func=NULL, ...) {
  require(quiRk)
  require(readr)

  if (is.null(func)) {
    func = read_csv
  }

  if (find_id) {
    files = list.files(path = fp, pattern = paste0('*.', ext), full.names=T)
    dfs = lapply(files, func, ...)

    vals = quiRk::get_filename_info(files, pattern, simplify=F)
    dfs = quiRk::add_filename_info(dfs, .id, vals)
  } else if (!is.null(pattern)) {
    # If we aren't finding a subject number, just use pattern to select files
    files = list.files(path = fp, pattern = pattern, full.names=T)
    dfs = lapply(files, func, ...)
  } else {
    files = list.files(path = fp, pattern = paste0('*.', ext), full.names=T)
    dfs = lapply(files, func, ...)
  }

  dfs %>%
    bind_rows()
}
