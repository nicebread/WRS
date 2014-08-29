\name{twopcor}
\Rdversion{1.1}
\alias{twopcor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute a .95 confidence interval for the difference between two Pearson correlations corresponding to two independent groups
}
\description{
This function uses an adjusted percentile bootstrap method that gives good results when the error term is heteroscedastic.

WARNING: If the number of boostrap samples is altered, it is unknown how to adjust the confidence interval when n1+n2 < 250.
}
\usage{
twopcor(x1, y1, x2, y2, SEED = TRUE)
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
  \item{SEED}{
%%     ~~Describe \code{SEED} here~~
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
function (x1, y1, x2, y2, SEED = T) 
{
    nboot <- 599
    if (SEED) 
        set.seed(2)
    X <- elimna(cbind(x1, y1))
    x1 <- X[, 1]
    y1 <- X[, 2]
    X <- elimna(cbind(x2, y2))
    x2 <- X[, 1]
    y2 <- X[, 2]
    print("Taking bootstrap samples; please wait")
    data1 <- matrix(sample(length(y1), size = length(y1) * nboot, 
        replace = T), nrow = nboot)
    bvec1 <- apply(data1, 1, pcorbsub, x1, y1)
    data2 <- matrix(sample(length(y2), size = length(y2) * nboot, 
        replace = T), nrow = nboot)
    bvec2 <- apply(data2, 1, pcorbsub, x2, y2)
    bvec <- bvec1 - bvec2
    ilow <- 15
    ihi <- 584
    if (length(y1) + length(y2) < 250) {
        ilow <- 14
        ihi <- 585
    }
    if (length(y1) + length(y2) < 180) {
        ilow <- 11
        ihi <- 588
    }
    if (length(y1) + length(y2) < 80) {
        ilow <- 8
        ihi <- 592
    }
    if (length(y1) + length(y2) < 40) {
        ilow <- 7
        ihi <- 593
    }
    bsort <- sort(bvec)
    r1 <- cor(x1, y1)
    r2 <- cor(x2, y2)
    ci <- c(bsort[ilow], bsort[ihi])
    list(r1 = r1, r2 = r2, ci = ci)
  }
}

