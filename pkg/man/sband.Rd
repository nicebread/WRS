\name{sband}
\alias{sband}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute a confidence band for the shift function
}
\description{
Compute a confidence band for the shift function. Assuming two independent groups are being compared. The default critical value is the approximate .05 critical value.

If flag is F (false), the exact significance level is not computed.
If plotit=T, a plot of the shift function is created, assuming that the graphics window has already been activated.

This function removes all missing observations. When plotting, the median of x is marked with a + and the two
quaratiles are marked with o.

sm=T, shift function is smoothed using:
op!=1, running interval smoother, otherwise use lowess.
}
\usage{
sband(x, y, crit = 1.36 * sqrt((length(x) + length(y))/(length(x) * length(y))), flag = FALSE, plotit = TRUE, sm = TRUE, op = 1, xlab = "First Group", ylab = "Delta", pr = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{crit}{
%%     ~~Describe \code{crit} here~~
}
  \item{flag}{
%%     ~~Describe \code{flag} here~~
}
  \item{plotit}{
%%     ~~Describe \code{plotit} here~~
}
  \item{sm}{
%%     ~~Describe \code{sm} here~~
}
  \item{op}{
%%     ~~Describe \code{op} here~~
}
  \item{xlab}{
%%     ~~Describe \code{xlab} here~~
}
  \item{ylab}{
%%     ~~Describe \code{ylab} here~~
}
  \item{pr}{
%%     ~~Describe \code{pr} here~~
}
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}


\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}
