# Import data from a file, URL, database, or installed R dataset.
import_data <- function(
  source = c("file", "url", "database", "dataset"),
  path = NULL,
  connection = NULL,
  table = NULL,
  query = NULL,
  dataset = NULL,
  package = "datasets"
) {
  # Match the requested source to one supported option.
  source <- match.arg(source)

  # Read a local file or download a file from a web address.
  if (source %in% c("file", "url")) {
    if (source == "url") {
      # Download the file temporarily and remove it after importing.
      source_url <- path
      extension <- tools::file_ext(sub("[?#].*$", "", path))
      path <- tempfile(fileext = paste0(".", extension))
      download.file(source_url, path, mode = "wb", quiet = TRUE)
      on.exit(unlink(path))
    }

    # Use the reader that matches the file extension.
    extension <- tolower(tools::file_ext(path))

    if (extension == "csv") return(read.csv(path))
    if (extension == "tsv") return(read.delim(path))
    if (extension %in% c("xls", "xlsx")) return(readxl::read_excel(path))
    if (extension == "json") return(jsonlite::fromJSON(path))
    if (extension == "rds") return(readRDS(path))
    if (extension %in% c("rdata", "rda")) {
      file_environment <- new.env()
      objects <- load(path, envir = file_environment)
      return(mget(objects, envir = file_environment))
    }

    stop("File type not supported. Try CSV, TSV, Excel, JSON, RDS, or RData.")
  }

  # Read a database table or run a SQL query.
  if (source == "database") {
    if (!is.null(query)) return(DBI::dbGetQuery(connection, query))
    return(DBI::dbReadTable(connection, table))
  }

  # Load a dataset from an installed R package.
  dataset_environment <- new.env()
  data(list = dataset, package = package, envir = dataset_environment)
  get(dataset, envir = dataset_environment)
}
