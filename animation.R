library(animation)

n = 20
x = sort(rnorm(n))
y = rnorm(n)

par(bg = "white")
plot(x, y, type = "n")
ani.record(reset = TRUE)

for(i in 1:n) {
  points(x[i], y[i], pch = 19, cex = 2)
  ani.record()
}

oopts = ani.options(interval = 0.5)
ani.replay()

saveHTML(ani.replay(), img.name = "record_plot")
saveHTML({
  dev.control("enable")
  par(bg = "white")
  plot(x, y, type = "n")
  for(i in 1:n){
    points(x[i], y[i], pch = 19, cex = 2)
    ani.record(reset = TRUE, replay.cur = TRUE)
  }
})

ani.options(oopts)