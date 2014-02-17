\name{onesampb}
\alias{onesampb}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute a bootstrap, .95 confidence interval for any measure of location
}
\description{
Compute a bootstrap, .95 confidence interval for the measure of location corresponding to the argument est.
By default, a one-step M-estimator of location based on Huber's Psi is used. The default number of bootstrap samples is nboot=2000
}
\usage{
onesampb(x, est = onestep, alpha = 0.05, nboot = 2000, SEED = TRUE, nv=0, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector
}
  \item{est}{
A function that directly returns a measure of location; default = one-step M-estimator of location based on Huber's Psi
}
  \item{alpha}{
Alpha value of the CI
}
  \item{nboot}{
Number of bootstrap samples
}
  \item{SEED}{
Set seed of random number generator so that results can be replicated
}
\item{nv}{
null value when  computing a p-value
}
  \item{\dots}{
Additional arguments for the estimator functio.
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