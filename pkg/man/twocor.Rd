\name{twocor}
\Rdversion{1.1}
\alias{twocor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute a .95 confidence interval for the difference between two correlation coefficients corresponding to two independent groups
}
\description{
The function corfun is any function that returns a
correlation coefficient in corfun$cor. The functions pbcor and
wincor follow this convention.

For Pearson's correlation, use the function twopcor instead.

The default number of bootstrap samples is nboot=599
}
\usage{
twocor(x1, y1, x2, y2, corfun = pbcor, nboot = 599, alpha = 0.05, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x1}{
%%     ~~Describe \code{x1} here~~
}
  \item{y1}{
%%     ~~Describe \code{y1} here~~
}
  \item{x2}{
%%     ~~Describe \code{x2} here~~
}
  \item{y2}{
%%     ~~Describe \code{y2} here~~
}
  \item{corfun}{
%%     ~~Describe \code{corfun} here~~
}
  \item{nboot}{
%%     ~~Describe \code{nboot} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x1, y1, x2, y2, corfun = pbcor, nboot = 599, alpha = 0.05, 
    SEED = T, ...) 
{
    if (SEED) 
        set.seed(2)
    print("Taking bootstrap samples. Please wait.")
    data1 <- matrix(sample(length(y1), size = length(y1) * nboot, 
        replace = T), nrow = nboot)
    bvec1 <- apply(data1, 1, corbsub, x1, y1, corfun, ...)
    data2 <- matrix(sample(length(y2), size = length(y2) * nboot, 
        replace = T), nrow = nboot)
    bvec2 <- apply(data2, 1, corbsub, x2, y2, corfun, ...)
    bvec <- bvec1 - bvec2
    bsort <- sort(bvec)
    term <- alpha/2
    ihi <- floor((1 - term) * nboot + 0.5)
    ilow <- floor(term * nboot + 0.5)
    corci <- 1
    corci[1] <- bsort[ilow]
    corci[2] <- bsort[ihi]
    r1 <- corfun(x1, y1)$cor
    r2 <- corfun(x2, y2)$cor
    reject <- "NO"
    if (corci[1] > 0 || corci[2] < 0) 
        reject = "YES"
    list(r1 = r1, r2 = r2, ci.dif = corci, reject = reject)
  }
}

