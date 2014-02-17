\name{pbcor}
\Rdversion{1.1}
\alias{pbcor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Percentage Bend Correlation (bivariate)
}
\description{
Compute the percentage bend correlation between x and y.
}
\usage{
pbcor(x, y, beta = 0.2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{beta}{
beta is the bending constant for omega sub N.
}
}
\details{

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
\code{\link{pball}}, \code{\link{corb}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, y, beta = 0.2) 
{
    if (length(x) != length(y)) 
        stop("The vectors do not have equal lengths")
    if (sum(is.na(c(x, y))) != 0) {
        m1 <- matrix(c(x, y), length(x), 2)
        m1 <- elimna(m1)
        x <- m1[, 1]
        y <- m1[, 2]
    }
    temp <- sort(abs(x - median(x)))
    omhatx <- temp[floor((1 - beta) * length(x))]
    temp <- sort(abs(y - median(y)))
    omhaty <- temp[floor((1 - beta) * length(y))]
    a <- (x - pbos(x, beta))/omhatx
    b <- (y - pbos(y, beta))/omhaty
    a <- ifelse(a <= -1, -1, a)
    a <- ifelse(a >= 1, 1, a)
    b <- ifelse(b <= -1, -1, b)
    b <- ifelse(b >= 1, 1, b)
    pbcor <- sum(a * b)/sqrt(sum(a^2) * sum(b^2))
    test <- pbcor * sqrt((length(x) - 2)/(1 - pbcor^2))
    sig <- 2 * (1 - pt(abs(test), length(x) - 2))
    list(cor = pbcor, test = test, siglevel = sig)
  }
}

