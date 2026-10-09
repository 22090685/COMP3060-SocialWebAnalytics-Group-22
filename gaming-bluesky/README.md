# What's Trending in Gaming on Bluesky?

COMP3020 Social Web Analytics - Group 22

Group members: Anamol Gautam (22226775), Dikshant Thapa (22214022), Ricky Melo (22090685)

## Research questions

1. Which gaming topics are the most frequently discussed on Bluesky?
2. Which gaming topics are currently trending relative to their historical frequency?
3. What gaming events, releases or community discussions are associated with changes in post volume, engagement and sentiment?

## Pipeline

Run the scripts in order from the project root (the folder containing this README).

| Step | Script | Output |
|------|--------|--------|
| 0 | `R/00_setup.R` | packages, config, helpers (sourced by the others) |
| 1 | `R/data_collection.R` | `data/raw/posts_raw.rds` |
| 2 | `R/data_cleaning.R` | `data/clean/posts_clean.rds`, `data/clean/edges.rds` |
| 3 | `R/exploratory_analysis.R` | summaries + figures (volume, engagement, words) |
| 4 | `R/analysis.R` | hypothesis test, clustering, network analysis |
| 5 | `R/visualisations.R` | final figures for poster and report in `figures/` |
| 6 | `report/report.Rmd` | analytical report (knit to PDF) |

## Bluesky credentials

`app.bsky.feed.searchPosts` needs authentication. Create an **App Password** in Bluesky
(Settings -> Privacy and security -> App passwords), then copy `.Renviron.example` to `.Renviron`
and fill it in. **Never commit `.Renviron`** (it is in `.gitignore`).

## Branches

One branch per piece of work, merged into `main` by pull request.

- `feature/data-collection`
- `feature/data-cleaning`
- `feature/exploratory-analysis`
- `feature/analysis`
- `feature/visualisations`
- `feature/report`

## Mapping to assignment tasks

- 2.1 Data collection -> `data_collection.R`
- 2.3 Text/content analysis and visualisation -> `data_cleaning.R`, `exploratory_analysis.R`
- 2.2 Hypothesis testing, 2.4 Clustering, 2.5 Network analysis -> `analysis.R`
