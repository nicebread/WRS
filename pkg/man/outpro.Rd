\name{outpro}
\Rdversion{1.1}
\alias{outpro}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Detect outliers using a modification of the
Stahel-Donoho  projection method
}
\description{
Determine center of data cloud, for each point,
connect it with center, project points onto this line
and use distances between projected points to detect
outliers. A boxplot method is used on the
projected distances.

plotit=T creates a scatterplot when working with 
bivariate data.

op=T 
means the .5 depth contour is plotted 
based on data with outliers removed.

op=F
means .5 depth contour is plotted without removing outliers.

MM=F  Use interquatile range when checking for outliers
MM=T  uses MAD.

If value for center is not specified,
there are four options for computing the center of the
cloud of points when computing projections:

cop=2 uses MCD center
cop=3 uses median of the marginal distributions.
cop=4 uses MVE center
cop=5 uses TBS
cop=6 uses rmba (Olive's median ball algorithm)
cop=7 uses the spatial (L1) median

When using cop=2, 3 or 4, default critical value for outliers 
is square root of the .975 quantile of a 
chi-squared distribution with p degrees 
of freedom.

Donoho-Gasko (Tukey) median is marked with a cross, +.
}
\usage{
outpro(m, gval = NA, center = NA, plotit = TRUE, op = TRUE, MM = FALSE, 
	cop = 3, xlab = "VAR 1", ylab = "VAR 2", STAND=TRUE,
	tr = 0.2, q = 0.5, pr=TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{m}{
%%     ~~Describe \code{m} here~~
}
  \item{gval}{
%%     ~~Describe \code{gval} here~~
}
  \item{center}{
%%     ~~Describe \code{center} here~~
}
  \item{plotit}{
%%     ~~Describe \code{plotit} here~~
}
  \item{op}{
%%     ~~Describe \code{op} here~~
}
  \item{MM}{
%%     ~~Describe \code{MM} here~~
}
  \item{cop}{
%%     ~~Describe \code{cop} here~~
}
  \item{xlab}{
%%     ~~Describe \code{xlab} here~~
}
  \item{ylab}{
%%     ~~Describe \code{ylab} here~~
}
\item{STAND}{STAND=T means that marginal distributions are standardized before checking for outliers.}
\item{tr}{ -}
\item{q}{ -}
\item{pr}{ -}
\item{...}{ -}
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
function (m, gval = NA, center = NA, plotit = T, op = T, MM = F, 
    cop = 3, xlab = "VAR 1", ylab = "VAR 2") 
{
    library(MASS)
    m <- as.matrix(m)
    if (ncol(m) == 1) {
        dis <- (m - median(m))^2/mad(m)^2
        dis <- sqrt(dis)
        crit <- sqrt(qchisq(0.975, 1))
        chk <- ifelse(dis > crit, 1, 0)
        vec <- c(1:nrow(m))
        outid <- vec[chk == 1]
        keep <- vec[chk == 0]
    }
    if (ncol(m) > 1) {
        if (is.na(gval) && cop == 1) 
            gval <- sqrt(qchisq(0.95, ncol(m)))
        if (is.na(gval) && cop != 1) 
            gval <- sqrt(qchisq(0.975, ncol(m)))
        m <- elimna(m)
        if (cop == 1 && is.na(center[1])) {
            if (ncol(m) > 2) 
                center <- dmean(m, tr = 0.5, cop = 1)
            if (ncol(m) == 2) {
                tempd <- NA
                for (i in 1:nrow(m)) tempd[i] <- depth(m[i, 1], 
                  m[i, 2], m)
                mdep <- max(tempd)
                flag <- (tempd == mdep)
                if (sum(flag) == 1) 
                  center <- m[flag, ]
                if (sum(flag) > 1) 
                  center <- apply(m[flag, ], 2, mean)
            }
        }
        if (cop == 2 && is.na(center[1])) {
            center <- cov.mcd(m)$center
        }
        if (cop == 4 && is.na(center[1])) {
            center <- cov.mve(m)$center
        }
        if (cop == 3 && is.na(center[1])) {
            center <- apply(m, 2, median)
        }
        if (cop == 5 && is.na(center[1])) {
            center <- tbs(m)$center
        }
        if (cop == 6 && is.na(center[1])) {
            center <- rmba(m)$center
        }
        if (cop == 7 && is.na(center[1])) {
            center <- spat(m)
        }
        flag <- rep(0, nrow(m))
        outid <- NA
        vec <- c(1:nrow(m))
        for (i in 1:nrow(m)) {
            B <- m[i, ] - center
            dis <- NA
            BB <- B^2
            bot <- sum(BB)
            if (bot != 0) {
                for (j in 1:nrow(m)) {
                  A <- m[j, ] - center
                  temp <- sum(A * B) * B/bot
                  dis[j] <- sqrt(sum(temp^2))
                }
                temp <- idealf(dis)
                if (!MM) 
                  cu <- median(dis) + gval * (temp$qu - temp$ql)
                if (MM) 
                  cu <- median(dis) + gval * mad(dis)
                outid <- NA
                temp2 <- (dis > cu)
                flag[temp2] <- 1
            }
        }
        if (sum(flag) == 0) 
            outid <- NA
        if (sum(flag) > 0) 
            flag <- (flag == 1)
        outid <- vec[flag]
        idv <- c(1:nrow(m))
        keep <- idv[!flag]
        if (ncol(m) == 2) {
            if (plotit) {
                plot(m[, 1], m[, 2], type = "n", xlab = xlab, 
                  ylab = ylab)
                points(m[keep, 1], m[keep, 2], pch = "*")
                if (length(outid) > 0) 
                  points(m[outid, 1], m[outid, 2], pch = "o")
                if (op) {
                  tempd <- NA
                  keep <- keep[!is.na(keep)]
                  mm <- m[keep, ]
                  for (i in 1:nrow(mm)) tempd[i] <- depth(mm[i, 
                    1], mm[i, 2], mm)
                  mdep <- max(tempd)
                  flag <- (tempd == mdep)
                  if (sum(flag) == 1) 
                    center <- mm[flag, ]
                  if (sum(flag) > 1) 
                    center <- apply(mm[flag, ], 2, mean)
                  m <- mm
                }
                points(center[1], center[2], pch = "+")
                x <- m
                temp <- fdepth(m, plotit = F)
                flag <- (temp >= median(temp))
                xx <- x[flag, ]
                xord <- order(xx[, 1])
                xx <- xx[xord, ]
                temp <- chull(xx)
                xord <- order(xx[, 1])
                xx <- xx[xord, ]
                temp <- chull(xx)
                lines(xx[temp, ])
                lines(xx[c(temp[1], temp[length(temp)]), ])
            }
        }
    }
    list(out.id = outid, keep = keep)
  }
}

