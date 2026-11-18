data_matrix <- as.matrix(iris[1:4])

cat("Column means with apply():\n")
print(apply(data_matrix, 2, mean))

cat("Column means with lapply():\n")
print(lapply(iris[1:4], mean))

cat("Column means with sapply():\n")
print(sapply(iris[1:4], mean))

cat("Column means with vapply():\n")
print(vapply(iris[1:4], mean, numeric(1)))

cat("Mean petal length by species with tapply():\n")
print(tapply(iris$Petal.Length, iris$Species, mean))

cat("Paired values with mapply():\n")
print(mapply(function(length, width) length / width,
             iris$Petal.Length[1:5], iris$Petal.Width[1:5]))
