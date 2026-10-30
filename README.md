# Simple R Data Import

Open `R-Data-Importer.Rproj` in RStudio, then run:

```r
source("R/import_data.R")
```

## Import a file

```r
my_data <- import_data("file", path = "data/my_data.csv")
```

Supported files: CSV, TSV, Excel, JSON, RDS, and RData. Excel needs the
`readxl` package; JSON needs `jsonlite`.

```r
install.packages("readxl")
install.packages("jsonlite")
```

## Import from a web address

```r
my_data <- import_data("url", path = "https://example.com/data.csv")
```

## Import from a database

Connect to a database with DBI, then give the connection and table name:

```r
install.packages(c("DBI", "RSQLite"))

connection <- DBI::dbConnect(RSQLite::SQLite(), "my_database.sqlite")
my_data <- import_data(
  "database",
  connection = connection,
  table = "my_table"
)
```

You can import a query instead of a table:

```r
my_data <- import_data(
  "database",
  connection = connection,
  query = "SELECT * FROM my_table"
)
```

Close the connection when you are finished:

```r
DBI::dbDisconnect(connection)
```

## Import a dataset included with R

```r
my_data <- import_data("dataset", dataset = "iris")
```

For another package's dataset, set `package`, for example
`import_data("dataset", dataset = "storms", package = "dplyr")`.

## Test

Run `Rscript tests/test_import_data.R` from this project folder.
