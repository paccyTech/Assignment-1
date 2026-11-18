model <- lm(mpg ~ wt, data = mtcars)

cat("Model summary:\n")
print(summary(model))

new_cars <- data.frame(wt = c(2.5, 3, 3.5))
cat("Predicted miles per gallon:\n")
print(predict(model, newdata = new_cars))

plot(mtcars$wt, mtcars$mpg,
     xlab = "Weight (1000 lbs)",
     ylab = "Miles per gallon",
     main = "Fuel economy by car weight")
abline(model, col = "blue", lwd = 2)
