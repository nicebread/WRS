install.packages(c('akima', 'cobs', 'robust', 'scatterplot3d', 'rrcov', 'lars', 'trimcluster', 'mc2d', 'Rfit', 'DepthProc', 'fda', 'rankFD'))

# WRScpp does not work any more
# install.package('WRScpp')

library(tools)
library(devtools)

# check for non-ASCII characters
for (nm in list.files("pkg/R", full.names=TRUE)) {
	cat(nm,":")    
   showNonASCIIfile(nm)    
	cat("\n")
}

# check Rd files - any line longer than 100 characters etc?
for (nm in list.files(".", pattern=".*\\.Rd", recursive=TRUE)) {
	cat(nm,":")    
   checkRd(nm)    
	cat("\n")
}


devtools::check("pkg", document=FALSE)
devtools::install("pkg")

# ---------------------------------------------------------------------
# Test some functions

library(WRS)
timevec <- c(77, 87, 88, 114, 151, 210, 219, 246, 253, 262, 296, 299, 306, 376, 428, 515, 666, 1310, 2611)
trimse(timevec, 0.1)
winmean(timevec, 0.1)
msmedse(timevec)

x <- rnorm(100)
y <- .3*x+rnorm(100)
m <- matrix(cbind(x, y), ncol=2)
outproMC(m)
wmw.RZR(x, y)
runbin.CI(x, y)