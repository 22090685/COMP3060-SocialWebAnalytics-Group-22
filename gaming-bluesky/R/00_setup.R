# 00_setup.R - packages, configuration and shared helpers
# Sourced by every other script. Run from the project root.

pkgs <- c("tidyverse", "httr2", "jsonlite", "lubridate", "tidytext",
          "Matrix", "igraph", "ggraph", "wordcloud", "cluster", "broom", "scales")
missing_pkgs <- setdiff(pkgs, rownames(installed.packages()))
if (length(missing_pkgs) > 0) install.packages(missing_pkgs)
invisible(lapply(pkgs, library, character.only = TRUE))

set.seed(3020)

# ---- Configuration ---------------------------------------------------------

# Collection window: weekly windows ending today, so each topic has a history
# to compare "current" volume against.
WINDOW_END   <- Sys.Date()
WINDOW_WEEKS <- 12
WINDOW_START <- WINDOW_END - 7 * WINDOW_WEEKS

# Max pages of 100 posts per topic per week (controls data volume / run time)
MAX_PAGES_PER_WINDOW <- 5

# topic label -> search query. Edit freely; keep queries specific enough to be gaming.
TOPICS <- c(
  "Nintendo Switch 2" = "\"Switch 2\"",
  "Zelda"             = "Zelda",
  "Pokemon"           = "Pokemon OR Pokémon",
  "Minecraft"         = "Minecraft",
  "Elden Ring"        = "\"Elden Ring\" OR Fromsoft",
  "GTA"               = "\"GTA 6\" OR \"GTA VI\"",
  "Baldur's Gate 3"   = "\"Baldur's Gate\" OR BG3",
  "Hollow Knight"     = "\"Hollow Knight\" OR Silksong",
  "PlayStation"       = "PlayStation OR PS5",
  "Xbox"              = "Xbox",
  "Steam"             = "\"Steam Deck\" OR \"Steam sale\" OR \"on Steam\"",
  "Indie games"       = "#indiegames OR #indiedev",
  "Fortnite"          = "Fortnite",
  "Valorant"          = "Valorant"
)

PATHS <- list(
  raw   = "data/raw/posts_raw.rds",
  clean = "data/clean/posts_clean.rds",
  edges = "data/clean/edges.rds",
  fig   = "figures"
)

# ---- Helpers ---------------------------------------------------------------

# Safe extraction of a nested field; returns NA if missing
`%||%` <- function(a, b) if (is.null(a) || length(a) == 0) b else a

# Consistent theme for all figures
theme_g22 <- function() theme_minimal(base_size = 12) +
  theme(plot.title = element_text(face = "bold"),
        panel.grid.minor = element_blank())

save_fig <- function(plot, name, w = 8, h = 5) {
  dir.create(PATHS$fig, showWarnings = FALSE, recursive = TRUE)
  ggsave(file.path(PATHS$fig, paste0(name, ".png")), plot, width = w, height = h, dpi = 300)
}
