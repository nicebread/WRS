\name{trimpb}
\Rdversion{1.1}
\alias{trimpb}
\title{
Compute a 1-alpha confidence interval for a trimmed mean.
}
\description{
The default number of bootstrap samples is nboot=2000

win is the amount of Winsorizing before bootstrapping when WIN=T.

Missing values are automatically removed.

null.value is null value. That test hypothesis trimmed mean equals null.value.

plotit=T gives a plot of the bootstrap values
pop=1 results in the expected frequency curve.
pop=2 kernel density estimate
pop=3 boxplot
pop=4 stem-and-leaf
pop=5 histogram
pop=6 adaptive kernel density estimate.

fr controls the amount of smoothing when plotting the bootstrap values
via the function rdplot. fr=NA means the function will use fr=.8
(When plotting bivariate data, rdplot uses fr=.6 by default.)
}
\usage{
trimpb(x, tr = 0.2, alpha = 0.05, nboot = 2000, WIN = FALSE, win = 0.1, plotit = FALSE, pop = 1, null.value = 0, pr = TRUE, xlab = "X", fr = NA)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{tr}{
%%     ~~Describe \code{tr} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
  \item{nboot}{
%%     ~~Describe \code{nboot} here~~
}
  \item{WIN}{
%%     ~~Describe \code{WIN} here~~
}
  \item{win}{
%%     ~~Describe \code{win} here~~
}
  \item{plotit}{
%%     ~~Describe \code{plotit} here~~
}
  \item{pop}{
%%     ~~Describe \code{pop} here~~
}
  \item{null.value}{
%%     ~~Describe \code{null.value} here~~
}
  \item{pr}{
%%     ~~Describe \code{pr} here~~
}
  \item{xlab}{
%%     ~~Describe \code{xlab} here~~
}
  \item{fr}{
%%     ~~Describe \code{fr} here~~
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
function (x, tr = 0.2, alpha = 0.05, nboot = 2000, WIN = F, win = 0.1, 
    plotit = F, pop = 1, null.value = 0, pr = T, xlab = "X", 
    fr = NA) 
{
    if (pr) {
        print("The p-value returned by the this function is based on the")
        print("null value specified by the argument null.value, which defaults to 0")
    }
    x <- x[!is.na(x)]
    if (WIN) {
        if (win > tr) 
            stop("The amount of Winsorizing must be <= to the amount of trimming")
        x <- winval(x, win)
    }
    crit <- alpha/2
    icl <- round(crit * nboot) + 1
    icu <- nboot - icl
    bvec <- NA
    set.seed(2)
    print("Taking bootstrap samples. Please wait.")
    data <- matrix(sample(x, size = length(x) * nboot, replace = T), 
        nrow = nboot)
    bvec <- apply(data, 1, mean, tr)
    bvec <- sort(bvec)
    p.value <- mean(bvec < null.value) + 0.5 * mean(bvec == null.value)
    p.value <- 2 * min(p.value, 1 - p.value)
    ci <- NA
    ci[1] <- bvec[icl]
    ci[2] <- bvec[icu]
    if (plotit) {
        if (pop == 1) 
            rdplot(as.vector(bvec), fr = fr, xlab = xlab)
        if (pop == 2) 
            kdplot(as.vector(bvec), rval = rval)
        if (pop == 3) 
            boxplot(as.vector(bvec))
        if (pop == 4) 
            stem(as.vector(bvec))
        if (pop == 5) 
            hist(as.vector(bvec))
        if (pop == 6) 
            akerd(as.vector(bvec), xlab = xlab)
    }
    list(ci = ci, p.value = p.value)
  }
}

