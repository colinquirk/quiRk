# Stolen and adapted from stack overflow:
# https://stackoverflow.com/questions/38554383/bootstrapped-confidence-intervals-with-dplyr

# Makes it easier to calculate bootstrapped CIs in a dplyr workflow with group by
# Additional arguments are passed on to Hmisc::smean.cl.boot

bootci <- function(x, var, ...) {
  require(magrittr)
  require(Hmisc)

  booted <- rbind(Hmisc::smean.cl.boot(x[[var]], ...)) %>%
    data.frame %>%
    setNames(paste(var,c("mean","boot_lower","boot_upper"),sep="_"))
}

# mtcars %>% group_by(cyl) %>% do(bootci(., 'mpg'))
# mtcars %>% group_by(cyl) %>% do(bootci(., 'mpg', conf.int=0.99))
