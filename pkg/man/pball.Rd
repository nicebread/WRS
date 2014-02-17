\name{pball}
\Rdversion{1.1}
\alias{pball}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Percentage Bend Correlation (matrix)
}
\description{
Compute the percentage bend correlation matrix for the 
data in the n by p matrix m.

This function also returns the two-sided significance level
for all pairs of variables, plus a test of zero correlations
among all pairs. (See chapter 6 for details.)
}
\usage{
pball(m, beta = 0.2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{m}{
%%     ~~Describe \code{m} here~~
}
  \item{beta}{
%%     ~~Describe \code{beta} here~~
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
function (m, beta = 0.2) 
{
    if (!is.matrix(m)) 
        stop("Data must be stored in an n by p matrix")
    pbcorm <- matrix(0, ncol(m), ncol(m))
    temp <- matrix(1, ncol(m), ncol(m))
    siglevel <- matrix(NA, ncol(m), ncol(m))
    cmat <- matrix(0, ncol(m), ncol(m))
    for (i in 1:ncol(m)) {
        ip1 <- i
        for (j in ip1:ncol(m)) {
            if (i < j) {
                pbc <- pbcor(m[, i], m[, j], beta)
                pbcorm[i, j] <- pbc$cor
                temp[i, j] <- pbcorm[i, j]
                temp[j, i] <- pbcorm[i, j]
                siglevel[i, j] <- pbc$siglevel
                siglevel[j, i] <- siglevel[i, j]
            }
        }
    }
    tstat <- pbcorm * sqrt((nrow(m) - 2)/(1 - pbcorm^2))
    cmat <- sqrt((nrow(m) - 2.5) * log(1 + tstat^2/(nrow(m) - 
        2)))
    bv <- 48 * (nrow(m) - 2.5)^2
    cmat <- cmat + (cmat^3 + 3 * cmat)/bv - (4 * cmat^7 + 33 * 
        cmat^5 + 240^cmat^3 + 855 * cmat)/(10 * bv^2 + 8 * bv * 
        cmat^4 + 1000 * bv)
    H <- sum(cmat^2)
    df <- ncol(m) * (ncol(m) - 1)/2
    h.siglevel <- 1 - pchisq(H, df)
    list(pbcorm = temp, siglevel = siglevel, H = H, H.siglevel = h.siglevel)
  }
}

