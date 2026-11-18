if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("Install ggplot2 first; see assignments/01-installing-packages/README.md.")
}

library(ggplot2)

base_plot <- ggplot(mpg, aes(x = displ, y = hwy))

print(base_plot + geom_point())
print(base_plot + geom_point() + geom_smooth(method = "lm", se = FALSE))
print(ggplot(mpg, aes(x = class)) + geom_bar())
print(ggplot(mpg, aes(x = class, y = hwy)) + geom_boxplot())
print(ggplot(mpg, aes(x = hwy)) + geom_histogram(binwidth = 2))
