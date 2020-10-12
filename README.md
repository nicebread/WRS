# WRS #
[![Last-changedate](https://img.shields.io/badge/last%20change-2020--10--12-yellowgreen.svg)](/commits/master)
[![packageversion](https://img.shields.io/badge/Package%20version-0.37.1-orange.svg?style=flat-square)](commits/master)


A package of R.R. Wilcox' robust statistics functions.
For more information, see [http://dornsife.usc.edu/labs/rwilcox/software/](http://dornsife.usc.edu/labs/rwilcox/software/).


## Installation ##

Note: On Mac OS you might need to install some developer tools (see here: [https://cran.rstudio.com/bin/macosx/tools/](https://cran.rstudio.com/bin/macosx/tools/)) for the installation of the WRScpp package.

    # first: install dependent packages
    install.packages(c("MASS", "akima", "robustbase"))
    
    # second: install suggested packages
    install.packages(c("cobs", "robust", "mgcv", "scatterplot3d", "quantreg", "rrcov", "lars", "pwr", "trimcluster", "mc2d", "psych", "Rfit", "DepthProc", "class", "fda"))
    
    # third: install an additional package which provides some C functions
    # install.packages("devtools")
    devtools::install_github("mrxiaohe/WRScpp")
    
    # fourth: install WRS
    install_github("nicebread/WRS", subdir="pkg")

