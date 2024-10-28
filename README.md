
# WWEAnalytics

## Overview

**WWEAnalytics** is an R package developed to analyze WWE Championship
reign data. It provides users with historical insights into WWE
Championship reigns, including the duration of title reigns and
comparative analysis across different eras and wrestlers. The package
includes easy-to-use functions for exploring reign patterns, interactive
data visualizations with ggplot2, and a user-friendly Shiny app for
interactive analysis.

## Key Features

- **WWE Championship Reign Data**: Access comprehensive WWE Championship
  reign data, including duration, era classification, and gender
  breakdowns.

- **Era-Based Analysis**: Explore title reign patterns across different
  WWE eras (Pre-1980s, 1980s-1990s, and 2000s-present) to understand how
  booking strategies have evolved.

- **Interactive Visualization**: Use the Shiny app to visualize and
  interact with the data, including filtering by gender, era, and top
  wrestlers by reign length.

- **Analysis Tools**: Built-in functions for calculating average reign
  lengths, comparing reigns across eras and gender, and visualizing
  trends in reign durations.

## Installation

Install the WWEAnalytics package directly from GitHub:

``` r
# Install WWEAnalytics from GitHub
remotes::install_github("ETC5523-2024/assignment-4-packages-and-shiny-apps-vsri0012")
```

    ## Using github PAT from envvar GITHUB_PAT. Use `gitcreds::gitcreds_set()` and unset GITHUB_PAT in .Renviron (or elsewhere) if you want to use the more secure git credential store instead.

    ## Downloading GitHub repo ETC5523-2024/assignment-4-packages-and-shiny-apps-vsri0012@HEAD

    ## withr (3.0.1 -> 3.0.2) [CRAN]

    ## Installing 1 packages: withr

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/v5/t9j60sg12xs36v3nw3wp03lc0000gn/T//RtmpD7Lbov/downloaded_packages
    ## ── R CMD build ─────────────────────────────────────────────────────────────────
    ##      checking for file ‘/private/var/folders/v5/t9j60sg12xs36v3nw3wp03lc0000gn/T/RtmpD7Lbov/remotes88c13827a8dc/ETC5523-2024-assignment-4-packages-and-shiny-apps-vsri0012-45bfdfa/DESCRIPTION’ ...  ✔  checking for file ‘/private/var/folders/v5/t9j60sg12xs36v3nw3wp03lc0000gn/T/RtmpD7Lbov/remotes88c13827a8dc/ETC5523-2024-assignment-4-packages-and-shiny-apps-vsri0012-45bfdfa/DESCRIPTION’
    ##   ─  preparing ‘WWEAnalytics’:
    ##      checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
    ##   ─  checking for LF line-endings in source and make files and shell scripts
    ##   ─  checking for empty or unneeded directories
    ##   ─  building ‘WWEAnalytics_0.0.0.9000.tar.gz’
    ##      
    ## 

    ## Warning in i.p(...): installation of package
    ## '/var/folders/v5/t9j60sg12xs36v3nw3wp03lc0000gn/T//RtmpD7Lbov/file88c148e2c061/WWEAnalytics_0.0.0.9000.tar.gz'
    ## had non-zero exit status

## Usage

### 1. Launching the Shiny App

Run the Shiny app to interactively explore WWE Championship reign data:

``` r
library(WWEAnalytics)
launch_shiny_app()
```

### 2. Analyzing Championship Reign Lengths with ggplot2

You can use ggplot2 with WWEAnalytics functions to visualize reign
lengths across different eras and genders.

``` r
# Example: Comparing Average Reign Length by Era
library(dplyr)
library(ggplot2)

# Calculate average reign by era
average_reign <- average_reign_length_by_era(wrestling_data_clean)

# Plot the data
ggplot(average_reign, aes(x = era, y = avg_reign_length, fill = era)) +
  geom_col() +
  labs(title = "Average WWE Championship Reign Length by Era",
       x = "Era",
       y = "Average Reign Length (days)") +
  theme_minimal()
```

## Data Sources

- **WWE Championship Reign Data**: Historical WWE Championship data
  containing reign details and wrestler demographics.

- **Era Classification**: Categorized into Pre-1980, 1980s-1990s, and
  2000s-present.

## License

This project is licensed under the MIT License. See the LICENSE file for
details.

## Contributions

Contributions are welcome! Feel free to fork the repository, submit pull
requests, or report issues to help improve the package.

## Documentation

For full documentation and tutorials, visit the pkgdown site here:
[WWEAnalytics
Documentation](https://etc5523-2024.github.io/assignment-4-packages-and-shiny-apps-vsri0012/)
