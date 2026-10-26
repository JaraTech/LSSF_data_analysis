# dependencies.R
# ---------------------------------------------------------------------------
# Shared package setup for the LSSF analysis notebooks.
#
# Each experiment's script loads its dependencies from here, so the package
# list lives in one place and a clean clone is reproducible. Source it once,
# near the top of a script, with a repo-relative path:
#
#     source(here::here("shared", "dependencies.R"))
#
# It installs any missing packages from CRAN, attaches them all, and sets the
# shared ggplot2 theme used across the paper's figures.
# ---------------------------------------------------------------------------

# Packages used across the LSSF experiments (comment = why it is needed).
.lssf_pkgs <- c(
  "here",     # portable, repo-relative paths (anchored by the .here file)
  "readxl",   # read_excel() for the .xlsx inputs
  "dplyr",    # data wrangling and the %>% pipe
  "tidyr",    # reshaping (pivot_longer, separate)
  "stringr",  # filename parsing (str_extract / str_remove)
  "ggplot2",  # every 2D plot
  "viridis",  # viridis_pal() colour ramp
  "plotly",   # the interactive 3D biomass surface
  "plot3D",   # static 3D biomass surface for the .svg/.png figure export
  "scales",   # scales::squish() in the transmittance plot
  # --- also used by Experiment 2 (BP) ---
  "car",         # leveneTest() / Anova() in the significance tests
  "multcompView",# multcompLetters() compact-letter displays
  "broom",       # tidy() the per-group lm fits
  "vegan",       # adonis2() / betadisper() PERMANOVA on the PCA scores
  "svglite",     # ggsave() SVG device for the .svg figure exports
  "ggpubr"       # stat_pvalue_manual() significance brackets (Exp2 ultimate-strength plot)
)

# Install any that are not already available, then attach all of them.
# library() (not require()) is used so an install that failed still stops the
# run with an informative error instead of silently continuing.
.lssf_missing <- setdiff(.lssf_pkgs, rownames(installed.packages()))
if (length(.lssf_missing) > 0) {
  message("Installing missing packages: ", paste(.lssf_missing, collapse = ", "))
  install.packages(.lssf_missing)
}
invisible(lapply(.lssf_pkgs, library, character.only = TRUE))

# Shared plotting theme for all figures.
theme_set(theme_bw() + theme(panel.grid = element_blank()))

# Remove the helper objects so they do not leak into the calling script.
rm(.lssf_pkgs, .lssf_missing)
