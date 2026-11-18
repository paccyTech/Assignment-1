source(file.path("R", "import_data.R"))

folder <- tempfile()
dir.create(folder)

data <- data.frame(id = 1:2, name = c("Ana", "Sam"))
csv_file <- file.path(folder, "data.csv")
write.csv(data, csv_file, row.names = FALSE)
stopifnot(identical(import_data("file", path = csv_file), data))

rds_file <- file.path(folder, "data.rds")
saveRDS(data, rds_file)
stopifnot(identical(import_data("file", path = rds_file), data))

stopifnot(identical(import_data("dataset", dataset = "iris"), datasets::iris))

if (requireNamespace("DBI", quietly = TRUE) &&
    requireNamespace("RSQLite", quietly = TRUE)) {
  connection <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  DBI::dbWriteTable(connection, "people", data)
  stopifnot(identical(import_data(
    "database",
    connection = connection,
    table = "people"
  ), data))
  DBI::dbDisconnect(connection)
}

unlink(folder, recursive = TRUE)
message("All tests passed.")
