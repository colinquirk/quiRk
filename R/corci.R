# Gets a confidence interval for a correlation using cor.test
# Additional arguments are passed to cor.test

corci = function(x, a, b, ...){
  require(magrittr)

  res = cor.test(x[[a]], x[[b]], ...)

  data.frame(
    mean = res$estimate,
    lower = res$conf.int[1],
    upper = res$conf.int[2]
  )
}

# mtcars %>% group_by(cyl) %>% do(corci(., 'mpg', 'hp'))
