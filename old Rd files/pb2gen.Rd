\name{pb2gen}
\Rdversion{1.1}
\alias{pb2gen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute a bootstrap confidence interval for the difference between any two parameters corresponding to independent groups
}
\description{
By default, MOM-estimators are compared.

Setting est=mean, for example, will result in a percentile
bootstrap confidence interval for the difference between means.
Setting est=onestep will compare M-estimators of location.

The default number of bootstrap samples is nboot=2000.
}
\usage{
pb2gen(x, y, alpha = 0.05, nboot = 2000, est = onestep, SEED = TRUE, pr = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
}
  \item{nboot}{
%%     ~~Describe \code{nboot} here~~
}
  \item{est}{
%%     ~~Describe \code{est} here~~
}
  \item{SEED}{
%%     ~~Describe \code{SEED} here~~
}
  \item{pr}{
%%     ~~Describe \code{pr} here~~
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
function (x, y, alpha = 0.05, nboot = 2000, est = onestep, SEED = TRUE, 
    pr = TRUE, ...) 
{
    x <- x[!is.na(x)]
    y <- y[!is.na(y)]
    if (SEED) 
        set.seed(2)
    if (pr) 
        print("Taking bootstrap samples. Please wait.")
    datax <- matrix(sample(x, size = length(x) * nboot, replace = T), 
        nrow = nboot)
    datay <- matrix(sample(y, size = length(y) * nboot, replace = T), 
        nrow = nboot)
    bvecx <- apply(datax, 1, est, ...)
    bvecy <- apply(datay, 1, est, ...)
    bvec <- sort(bvecx - bvecy)
    low <- round((alpha/2) * nboot) + 1
    up <- nboot - low
    temp <- sum(bvec < 0)/nboot + sum(bvec == 0)/(2 * nboot)
    sig.level <- 2 * (min(temp, 1 - temp))
    se <- var(bvec)
    list(ci = c(bvec[low], bvec[up]), p.value = sig.level, sq.se = se)
  }
}
