\name{fit.sensitivity.plot}
\alias{fit.sensitivity.plot}
\title{Visualise fit sensitivity for a breakage-resistance model}
\description{
Plots a contour map of the sensitivity of the residual error of a breakage resistance model
to variation of the fitted parameters.  This should give some idea of the goodness of the fit.}
\usage{
fit.sensitivity.plot(data, fit, rho = 51, l = 1000,
    r.range = 0.015, theta.range = pi/360, steps = 100,
    nlevels = 200, r.squared = TRUE, bound.at = 0.99, ...)
}
\arguments{
  \item{data}{
Measured breakage data as an XY list or data frame, with \code{data$x} holding the breakage distances
in microns, and \code{data$y} the corresponding resistance in megohms.  For compatibility with
\code{\link{breakage.plot}} and \code{\link{break.clust}}, these columns may instead by named
\code{Z} and \code{Mohm} respectively.
}
  \item{fit}{
The fitting results list returned by \code{\link{fit.breakage}}
}
  \item{rho}{
Resistivity of the filler solution, in ohm centimetres.  Must be the same value used for fitting
or the plot will be incorrect.
}
  \item{l}{
The initial length of the pipette tip, in microns.  Must be the same value used for fitting
or the plot will be incorrect.
}
  \item{r.range}{
The range above and below the fitted inner radius result, \code{r}, to test and plot, in microns.
}
  \item{theta.range}{
The range above and below the fitted half-cone angle result, \code{theta}, to test and plot, in radians.
}
  \item{steps}{
The total number of steps to evaluate in both directions.
}
  \item{nlevels}{
The number of contour lines to draw.
}
  \item{r.squared}{
Whether to plot the error value directly, or transform it to plot the coefficient of
determination (or R-squared) instead.  The latter is plotted by default. It contains
the same information in marginally more convenient form, but its use might be considered
misleading if taken as implying a linear model.
}
  \item{bound.at}{
A level at which to plot a significance contour. This is on top of the \code{nlevels}
contours automatically positioned by the main plot, and plotted in a different colour. 
}
  \item{\dots}{
Any additional parameters to be passed to the main \code{contour} plot.
}
}
\value{
  \item{x}{The x (theta) values of the plotted surface.}
  \item{y}{The y (radius) values of the plotted surface.}
  \item{z}{The z (error) values of the plotted surface.}
}
\author{Matthew Caldwell}

\seealso{
\code{\link{fit.breakage}}, 
}
\examples{
# fake up some breakage data
brks <- sort(abs(0.5 + rnorm(n=15, sd=0.5) * 1:15))
res <- resist.breakage(brks, theta=3*pi/180, r=0.04, rho=64) + rnorm(15)
dat <- list(x=brks, y=res)

# fit it
fit <- fit.breakage(dat, do.plot=FALSE)

# plot the sensitivity surface
fit.sensitivity.plot(dat, fit)
}
