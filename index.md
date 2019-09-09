[![Appveyor build status](https://ci.appveyor.com/api/projects/status/iicavfew3kfs20va/branch/master?svg=true)](https://ci.appveyor.com/project/KWB-R/kwb-dwa-m150/branch/master)
[![Build Status](https://travis-ci.org/KWB-R/kwb.dwa.m150.svg?branch=master)](https://travis-ci.org/KWB-R/kwb.dwa.m150)
[![codecov](https://codecov.io/github/KWB-R/kwb.dwa.m150/branch/master/graphs/badge.svg)](https://codecov.io/github/KWB-R/kwb.dwa.m150)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/kwb.dwa.m150)](https://cran.r-project.org/package=kwb.dwa.m150)

Read Sewer Condition Data according to DWA-M 150 XML format

## Installation

For details on how to install KWB-R packages checkout our [installation tutorial](https://kwb-r.github.io/kwb.pkgbuild/articles/install.html).

```r
### Optionally: specify GitHub Personal Access Token (GITHUB_PAT)
### See here why this might be important for you:
### https://kwb-r.github.io/kwb.pkgbuild/articles/install.html#set-your-github_pat

# Sys.setenv(GITHUB_PAT = "mysecret_access_token")

# Install package "remotes" from CRAN
if (! require("remotes")) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

# Install KWB package 'kwb.dwa.m150' from GitHub

remotes::install_github("kwb-r/kwb.dwa.m150")
```
