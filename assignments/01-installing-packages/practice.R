package <- "ggplot2"

if (!requireNamespace(package, quietly = TRUE)) {
  install.packages(package)
}

library(package, character.only = TRUE)
packageVersion(package)
