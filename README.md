# R Assignments

Each assignment is kept in its own folder under `assignments/`. Open the
folder's README for its overview and run instructions.

- `assignments/00-data-importer/` — importing data from files, URLs, databases,
  and installed R datasets.
- `assignments/01-installing-packages/` — installing and loading R packages.
- `assignments/02-first-class-programs/` — introductory R programs.
- `assignments/03-geom-variations/` — practicing `ggplot2` geometry layers.
- `assignments/04-apply-variations/` — practicing the `apply` family of functions.
- `assignments/05-linear-regression/` — fitting and interpreting a linear model.

Run an exercise from the repository root, for example:

```sh
Rscript assignments/02-first-class-programs/practice.R
```

The data-importer project has its own RStudio project file and tests. Open
`assignments/00-data-importer/R-Data-Importer.Rproj` in RStudio, or run its
tests from its folder:

```sh
Rscript tests/test_import_data.R
```

The package-installation exercise installs `ggplot2`, which is used by the geom
exercise.
