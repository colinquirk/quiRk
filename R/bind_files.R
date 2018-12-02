bind_files = function(fp, ext="csv", output='', find_id=F, pattern=NULL, .id=NULL) {
  require(readr)
  require(dplyr)
  require(stringr)

  get_file = function(f, append=T) {
    if (find_id) {
      temp = read_csv(f) %>%
        mutate(!!.id := id)
    } else {
      temp = read_csv(f)
    }
    write_csv(temp, output, append=append)
  }

  files = list.files(path = fp, pattern = paste0('*.', ext), full.names=T)

  if (find_id) {
    id = stringr::str_match(files, pattern)[,2]
  }

  get_file(files[[1]])

  NULL
}
