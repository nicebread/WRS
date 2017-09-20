sourceDir <- function(path, trace = TRUE, ...) {
   for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
      if(trace) cat(nm,":")           
      source(file.path(path, nm), ...)
      if(trace) cat("\n")
   }
}
sourceDir("pkg/R")




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


devtools::check("pkg")
devtools::install("pkg")

# ---------------------------------------------------------------------
# Test some functions

library(WRS)
timevec <- c(77, 87, 88, 114, 151, 210, 219, 246, 253, 262, 296, 299, 306, 376, 428, 515, 666, 1310, 2611)
trimse(timevec, 0.1)
winmean(timevec, 0.1)
msmedse(timevec)