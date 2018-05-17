# kwb.dwa.m150

[![Appveyor build status](https://ci.appveyor.com/api/projects/status/iicavfew3kfs20va/branch/master?svg=true)](https://ci.appveyor.com/project/KWB-R/kwb-dwa-m150/branch/master)
[![Build Status](https://travis-ci.org/KWB-R/kwb.dwa.m150.svg?branch=master)](https://travis-ci.org/KWB-R/kwb.dwa.m150)
[![codecov](https://codecov.io/github/KWB-R/kwb.dwa.m150/branch/master/graphs/badge.svg)](https://codecov.io/github/KWB-R/kwb.dwa.m150)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/kwb.dwa.m150)](https://cran.r-project.org/package=kwb.dwa.m150)

Read Sewer Condition Data according to DWA-M 150 XML format

## 1. Install from GitHub 

```r
if (! require("devtools")) { 
  install.packages("devtools")
}

devtools::install_github(repo = "kwb-r/kwb.dwa.m150", dependencies = TRUE)
```
