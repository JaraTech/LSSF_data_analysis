# LSSF — Data Analysis

Reproducible analysis for a study on **Liquid-Static Surface Fermentation (LSSF)**
for the production of mycelium materials (submitted to *Microbial Biotechnology*).
The repository contains the raw inputs and the R Markdown notebooks that generate
every figure and table reported in the manuscript.

## Repository layout

```
.here                     # anchor for here::here(); defines the project root
shared/
  dependencies.R          # single source of truth for packages + shared ggplot theme
experiments/
  Experiment_1/
    data/raw/             # measured inputs (.xlsx spreadsheets, images)
    scripts/Exp1.Rmd      # Experiment 1 notebook
    results/figures/      # exported figures (.svg)
    results/tables/       # exported tables (.csv/.xlsx)
  Experiment_2/
    data/raw/
    scripts/Exp2.Rmd
    results/figures/
    results/tables/
```

## Requirements

- R (>= 4.0) and the `here` package.
- All other packages are installed and attached automatically on first run by
  `shared/dependencies.R` (sourced at the top of each notebook).

## Running

Open either notebook and knit it, or run it chunk by chunk:

```r
# from the repository root
rmarkdown::render("experiments/Experiment_1/scripts/Exp1.Rmd")
rmarkdown::render("experiments/Experiment_2/scripts/Exp2.Rmd")
```

Paths are portable: `here::here()` resolves everything from the `.here` file at
the repository root, so the notebooks run from a clean clone with no manual path
edits. Output-writing lines (`ggsave()`, `write.table()`) are commented out by
default — uncomment the ones you want to regenerate.

## Figure / table naming

Final manuscript items are numbered (e.g. `1. Exp1_FBM.svg`, `S1. Exp2_ss.svg`);
all other outputs are prefixed `Exp1_` / `Exp2_`.
