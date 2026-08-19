# LSSF

Raw data and analysis code for the LSSF study (submitted to *Microbial
Biotechnology*).

Each experiment is a self-contained module under `experiments/`. To reproduce
one, open its folder and follow its README.

## Experiments

| ID           | Description                          | Folder |
|--------------|--------------------------------------|--------|
| Experiment_1 | RSM image analysis and statistics    | [experiments/Experiment_1](experiments/Experiment_1) |
| Experiment_2 | (to be added)                        | [experiments/Experiment_2](experiments/Experiment_2) |

*Add one row per experiment. To start a new one, copy `experiments/_TEMPLATE`.*

## Repository layout

    experiments/
      <ID>/
        data/
          raw/        primary data, measured once, NEVER regenerated
          processed/  script-generated data, regenerable from raw/
        scripts/      code (turns raw/ into processed/ and results/)
        results/      final figures & tables for the paper
        README.md     what the experiment is and how to run it
    shared/           code or resources used by more than one experiment
      dependencies.R  installs & loads the R packages the notebooks need
    .here             marker so R's here() can resolve repo-relative paths

The organising rule is provenance: everything outside `data/raw/` can be
rebuilt from `data/raw/` plus `scripts/`, so only `data/raw/` is irreplaceable.

## Requirements

- ImageJ 1.52+ or Fiji for the image-analysis macros.
- R (with RStudio recommended) for the `.Rmd` notebooks; they use the `here`
  package for portable paths.

## R dependencies

The R packages every notebook needs are declared in one place,
`shared/dependencies.R`. Each notebook loads them near the top with

    if (!requireNamespace("here", quietly = TRUE)) install.packages("here")
    source(here::here("shared", "dependencies.R"))

so there is nothing to install by hand: the first line bootstraps the `here`
package (used to resolve repo-relative paths), and sourcing the script installs
any of the remaining packages that are missing from CRAN, attaches them all,
and sets the shared plotting theme. Paths are anchored by the `.here` file at
the repo root, so this works from a clean clone with no edits.

To add a package for a new (or existing) experiment, add it to the list in
`shared/dependencies.R` rather than calling `library()` inside a notebook; that
keeps the dependency set in a single, reproducible place. The exact package
*versions* are not pinned — for a fully version-locked environment, initialise
[`renv`](https://rstudio.github.io/renv/) at the repo root.

## Citing

See `CITATION.cff`. Please cite the associated article once published.

## License

Code is released under the MIT License (`LICENSE`). Raw data is released under
CC BY 4.0 - please attribute the authors when reusing.
