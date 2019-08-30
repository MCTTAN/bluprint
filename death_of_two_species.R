
library(animation)

oopt = ani.options(nmax = ifelse(interactive(), 50, 2), interval = 0.3)
par(ann = FALSE, mar = rep(0, 4))
ecol.death.sim()

ani.options(nmax = ifelse(interactive(), 1000, 2), interval = -.02)
ecol.death.sim(col.sp = c(8, 2), pch.sp = c(20, 17))

ani.options(oopt)



# https://cran.r-project.org/web/packages/animation/animation.pdf