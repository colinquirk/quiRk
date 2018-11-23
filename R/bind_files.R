bind_files = function(fp, ext="csv", find_id=F, pattern=NULL, .id=NULL) {
  require(readr)
  require(dplyr)
  require(stringr)

  files = list.files(path = fp, pattern = paste0('*.', ext), full.names=T)

  if (find_id) {
    id = stringr::str_match(files, pattern)[,2]
    dat = setNames(lapply(files, FUN=read_csv), id) %>%
      bind_rows(.id = .id)
  } else {
    dat = lapply(files, FUN=read_csv) %>% bind_rows()
  }

  dat
}
