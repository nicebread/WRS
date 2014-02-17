# WRS #

A package of R.R. Wilcox' robust statistics functions.


## Installation ##


    # first: install dependent packages
    install.packages(c("MASS", "akima", "robustbase"))
    
    # second: install suggested packages
    install.packages(c("cobs", "robust", "mgcv", "scatterplot3d", "quantreg", "rrcov", "lars", "pwr", "trimcluster", "parallel", "mc2d", "psych", "Rfit"))
    
    # third: install an additional package which provides some C functions
    install.packages("devtools")
    library("devtools")
    install_github("WRScpp", username="mrxiaohe")
    
    # fourth: install WRS
    install_github("WRS", username="nicebread", subdir="pkg")