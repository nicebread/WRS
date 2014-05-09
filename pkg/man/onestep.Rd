\name{onestep}
\alias{onestep}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute one-step M-estimator of location using Huber's Psi
}
\description{
Compute one-step M-estimator of location using Huber's Psi. The default bending constant is 1.28
}
\usage{
onestep(x, bend = 1.28, na.rm = FALSE, MED = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A vector
}
  \item{bend}{
bending constant
}
  \item{na.rm}{
As usual ...
}
  \item{MED}{
MED=TRUE: initial estimate is the median
Otherwise use modified one-step M-estimator
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

\examples{
}
