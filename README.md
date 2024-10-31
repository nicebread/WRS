# WRS #
[![Last-changedate](https://img.shields.io/badge/last%20change-2024--10--31-yellowgreen.svg)](/commits/master)
[![packageversion](https://img.shields.io/badge/Package%20version-0.44-orange.svg?style=flat-square)](commits/master)


A package of R.R. Wilcox' robust statistics functions.
For more information, see [http://dornsife.usc.edu/labs/rwilcox/software/](http://dornsife.usc.edu/labs/rwilcox/software/).


## Installation ##

    # first: install dependent packages
    install.packages(c("MASS", "akima", "robustbase"))
    
    # second: install suggested packages
    install.packages(c("akima", "cobs", "robust", "mgcv", "scatterplot3d", "quantreg", "rrcov", "lars", "pwr", "trimcluster", "mc2d", "psych", "Rfit", "DepthProc", "class", "fda", "rankFD"))
    
    # third: install an additional package which provides some C functions
    # install.packages("devtools")
    # NOTE: This seems to be stalled and not functional any more
    # devtools::install_github("mrxiaohe/WRScpp")
    
    # fourth: install WRS
    install_github("nicebread/WRS", subdir="pkg")

