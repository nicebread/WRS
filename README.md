# WRS #

A package of R.R. Wilcox' robust statistics functions.
For more information, see [http://dornsife.usc.edu/labs/rwilcox/software/](http://dornsife.usc.edu/labs/rwilcox/software/).


## Installation ##


    # first: install dependent packages
    install.packages(c("MASS", "akima", "robustbase"))
    
    # second: install suggested packages
    install.packages(c("cobs", "robust", "mgcv", "scatterplot3d", "quantreg", "rrcov", "lars", "pwr", "trimcluster", "mc2d", "psych", "Rfit", "DepthProc", "class", "fda", "parallel"))
    
    # third: install an additional package which provides some C functions
    install.packages("devtools")
    library("devtools")
    install_github("mrxiaohe/WRScpp")
    
    # fourth: install WRS
    install_github("nicebread/WRS", subdir="pkg")