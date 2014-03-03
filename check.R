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


setwd("pkg")
devtools::check()

setwd("pkg")
devtools::install()
