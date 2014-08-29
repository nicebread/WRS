\name{yuen}
\Rdversion{1.1}
\alias{yuen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Yuen's test for trimmed means
}
\description{
Perform Yuen's test for trimmed means on the data in x and y.
The default amount of trimming is 20\%
Missing values (values stored as NA) are automatically removed.

A confidence interval for the trimmed mean of x minus the 
the trimmed mean of y is computed and returned in \code{yuen$ci}.
The p-value is returned in \code{yuen$p.value}

For an omnibus test with more than two independent groups, 
use t1way.
This function uses winvar from chapter 2.
}
\usage{
yuen(x, y, tr = 0.2, alpha = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{tr}{
%%     ~~Describe \code{tr} here~~
}
  \item{alpha}{
%%     ~~Describe \code{alpha} here~~
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
function (x, y, tr = 0.2, alpha = 0.05) 
{
    if (tr == 0.5) 
        stop("Using tr=.5 is not allowed; use a method designed for medians")
    if (tr > 0.25) 
        print("Warning: with tr>.25 type I error control might be poor")
    x <- x[!is.na(x)]
    y <- y[!is.na(y)]
    h1 <- length(x) - 2 * floor(tr * length(x))
    h2 <- length(y) - 2 * floor(tr * length(y))
    q1 <- (length(x) - 1) * winvar(x, tr)/(h1 * (h1 - 1))
    q2 <- (length(y) - 1) * winvar(y, tr)/(h2 * (h2 - 1))
    df <- (q1 + q2)^2/((q1^2/(h1 - 1)) + (q2^2/(h2 - 1)))
    crit <- qt(1 - alpha/2, df)
    dif <- mean(x, tr) - mean(y, tr)
    low <- dif - crit * sqrt(q1 + q2)
    up <- dif + crit * sqrt(q1 + q2)
    test <- abs(dif/sqrt(q1 + q2))
    yuen <- 2 * (1 - pt(test, df))
    list(ci = c(low, up), p.value = yuen, dif = dif, se = sqrt(q1 + 
        q2), teststat = test, crit = crit, df = df)
  }
}
