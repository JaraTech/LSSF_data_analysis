# Experiment 1 - RSM image analysis and statistics

Two-stage analysis of the RSM (Response Surface Methodology) experiment: a 7x7
design of incubation time x culture volume (49 samples). The ImageJ macro turns
colony photos into grey-value measurements; the R notebook integrates those
with biomass, pH, glucose, thickness and density data to produce the paper's
models, figures and tables.

## Layout
- `data/raw/` - primary measured data, never regenerated:
    - `images/` - the 49 source `.jpeg` colony photos
    - the measurement spreadsheets: `Exp1_biomass_pH.xlsx`, `Exp1_glucose.xlsx`,
      `Exp1_fbm2lyo.xlsx`
- `data/processed/` - generated, regenerable from raw + scripts:
    - `grey_values/` - ImageJ `Results*.jpeg.csv`
    - `annotated_images/` - ImageJ yellow-outline JPGs
- `scripts/` - `Script_imageJ_Exp1.txt` (ImageJ) and `Exp1.Rmd` (R)
- `results/` - final paper outputs:
    - `figures/` - the contour maps and other figures
    - `tables/` - `Exp1 - Glu.csv`, `Exp1 - BM & GV.csv`, `Exp1 - Master datatable.csv`

## Run order
1. ImageJ macro on `data/raw/images/`, writing to `data/processed/`
   (choose those folders when the macro prompts).
2. `Exp1.Rmd` in R/RStudio. The setup chunk sources
   `shared/dependencies.R`, which installs any missing R packages and loads
   them - no manual `install.packages()` needed. Paths resolve automatically
   via the `here` package (anchored by the `.here` file at the repo root) - no
   path edits needed. The notebook's `ggsave()` and `write.table()` calls write
   the figures to `results/figures/` and the three tables to `results/tables/`;
   they are commented out by default so a re-run does not overwrite the committed
   outputs - uncomment them to regenerate everything from scratch.
