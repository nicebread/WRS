\name{corb}
\Rdversion{1.1}
\alias{corb}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute a .95 confidence interval for a correlation
}
\description{
The default correlation is the percentage bend.

The function corfun is any function that returns a 
correlation coefficient in corfun$cor. The functions pbcor and
wincor follow this convention.

When using Pearson's correlation, and when n<250, use
lsfitci instead.

The default number of bootstrap samples is nboot=599
}
\usage{
corb(x, y, corfun = pbcor, nboot = 599, SEED = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{corfun}{
%%     ~~Describe \code{corfun} here~~
}
  \item{nboot}{
%%     ~~Describe \code{nboot} here~~
}
  \item{SEED}{
%%     ~~Describe \code{SEED} here~~
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
function (x, y, corfun = pbcor, nboot = 599, SEED = T, ...) 
{
    est <- corfun(x, y, ...)$cor
    if (SEED) 
        set.seed(2)
    data <- matrix(sample(length(y), size = length(y) * nboot, 
        replace = T), nrow = nboot)
    bvec <- apply(data, 1, corbsub, x, y, corfun, ...)
    ihi <- floor(0.975 * nboot + 0.5)
    ilow <- floor(0.025 * nboot + 0.5)
    bsort <- sort(bvec)
    corci <- 1
    corci[1] <- bsort[ilow]
    corci[2] <- bsort[ihi]
    phat <- sum(bvec < 0)/nboot
    sig <- 2 * min(phat, 1 - phat)
    list(cor.ci = corci, p.value = sig, cor.est = est)
  }
}

