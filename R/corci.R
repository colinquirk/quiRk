# Gets a confidence interval for a correlation using cor.test
# Additional arguments are passed to cor.test

corci = function(x, a, b, ...){
  require(magrittr)
  require(dplyr)

  res = cor.test(x[[a]], x[[b]], ...)

  data.frame(
    mean = res$estimate,
    lower = res$conf.int[1],
    upper = res$conf.int[2]
  ) %>%
  setNames(paste(a, b, "cor", c("estimate","lower","upper"),sep="_"))
}

# mtcars %>% group_by(cyl) %>% do(corci(., 'mpg', 'hp'))
