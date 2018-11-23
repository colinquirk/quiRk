bind_csvs = function(fp) {
  require(dplyr)
  files = list.files(path = fp, pattern = '*.csv')
  dat = lapply(files, FUN=read.csv) %>% bind_rows()
  dat
}