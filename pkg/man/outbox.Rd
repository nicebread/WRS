\name{outbox}
\alias{outbox}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Detects outliers using the boxplot rule
}
\description{
This function detects outliers using the boxplot rule, but unlike the R function boxplot, the ideal fourths are used to estimate the quartiles.
Setting mbox=T results in using the modification of the boxplot rule suggested by Carling (2000).
}
\usage{
outbox(x, mbox = FALSE, gval = NA, plotit = FALSE, STAND =
                 FALSE)
}
\arguments{
  \item{x}{
A vector
}
  \item{mbox}{
Setting mbox=T results in using the modification of the boxplot rule suggested by Carling (2000).
}
  \item{gval}{
}
  \item{plotit}{
Should a boxplot be drawn?
}
  \item{STAND}{
...
}
}
\value{
\item{out.val}{The values of the outliers}
\item{out.id}{The indexes of the outliers}
\item{keep}{The indexes of the non-outliers}
\item{cl, cu}{lower and upper confidence limit}
}
\references{
%% ~put references to the literature/web site here ~
}

\seealso{
\code{\link{outpro}}, \code{\link{out}}
}
\examples{
}

