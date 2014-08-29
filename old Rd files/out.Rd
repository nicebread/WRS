\name{out}
\alias{out}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Search for outliers using robust measures of location and scatter
}
\description{
Search for outliers using robust measures of location and scatter, which are used to compute robust analogs of Mahalanobis distance.

x is an n by p matrix or a vector of data.

The function returns the values flagged as an outlier plus the (row) number where the data point is stored. If x is a vector, out.id=4 indicates that the fourth observation is an outlier and outval=123 indicates that 123 is the value. If x is a matrix, out.id=4 indicates that the fourth row of the matrix is an outlier and outval reports the corresponding values.

The function also returns the distance of the points identified as outliers in the variable dis.

For bivariate data, if plotit=T, plot points and circle outliers.
}
\usage{
out(x, cov.fun = cov.mve, plotit = TRUE, SEED = TRUE, xlab = "X", ylab = "Y", qval = 0.975, crit = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector, or a 2-dim matrix
}
  \item{cov.fun}{
cov.fun determines how the measure of scatter is estimated. Possible choices are:
\itemize{
	\item cov.mve: the MVE estimate
	\item cov.mcd: the MCD estimate
	\item covmba2: the MBA or median ball algorithm
	\item rmba: an adjustment of MBA suggested by D. Olive
	\item cov.roc: Rocke's TBS estimator
	}
}
  \item{plotit}{
Should a plot be drawn? Only works for bivariate data
}
  \item{SEED}{
Set the random seed for reproducible results
}
  \item{xlab}{
%%     ~~Describe \code{xlab} here~~
}
  \item{ylab}{
%%     ~~Describe \code{ylab} here~~
}
  \item{qval}{
%%     ~~Describe \code{qval} here~~
}
  \item{crit}{
%%     ~~Describe \code{crit} here~~
}
  \item{\dots}{
Further arguments
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


\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}

