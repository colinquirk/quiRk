bind_csvs = function(fp) {
  require(dplyr)
  files = list.files(path = fp, pattern = '*.csv', full.names=T)
  dat = lapply(files, FUN=read_csv) %>% bind_rows()
  dat
}