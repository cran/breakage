\name{fit.breakage}
\alias{fit.breakage}
\title{Fit a tip geometry model to breakage resistance data}
\description{
Estimates pipette tip half-cone angle and initial inner radius from the resistance vs
breakage distance data.  Fitting is performed by minimisation of the residual sum of squares
calculated by \code{\link{err.breakage}}.  By default, a plot of the data and the fitted
model is drawn.
}
\usage{
fit.breakage(data, start = list(theta = 3 * pi/180, r = 0.05),
    rho = 51, l = 1000, do.plot = TRUE, ...)
}
\arguments{
  \item{data}{
Measured breakage data as an XY list or data frame, with \code{data$x} holding the breakage distances
in microns, and \code{data$y} the corresponding resistance in megohms.  For compatibility with
\code{\link{breakage.plot}} and \code{\link{break.clust}}, these columns may instead by named
\code{Z} and \code{Mohm} respectively.
}
  \item{start}{
List of initial values for the optimisation parameters.  Must contain values for \code{theta} and \code{r}.
The error function typically has a well-behaved minimum and the default start values should converge
in most cases.
}
  \item{rho}{
Resistivity of the filler solution, in ohm centimetres.  The default value of 51 ohm cm corresponds to a 150 mM solution of KCl.
}
  \item{l}{
The initial length of the pipette tip, in microns.  Because the resistance is dominated by the narrower
tip region, the precise value of this is not usually important provided it is much greater than
the breakage distance.
}
  \item{do.plot}{
Whether to plot a graph of the data and fit results if successful.
}
  \item{\dots}{
Additional parameters passed to the plotting functions.
}
}
\value{
  \item{theta}{The fitted estimate of the half-cone angle, in radians; or NA if the optimisation failed.}
  \item{r}{The fitted estimate of the tip inner radius, in microns; or NA if the optimisation failed.}
  \item{degrees}{The fitted estimate of the half-cone angle, in degrees; or NA if the optimisation failed.}
  \item{err}{The residual sum of squares error between the fitted model predictions and the data; or NA if the optimisation failed.}
  \item{opt}{The result structure returned by \code{\link{optim}}.  If the optimisation failed, this may provide some useful information as to why.}
}
\references{
Caldwell, M., Del Linz, S. J. L., Smart, T. G. S. and Moss, G. W. J. 2012
Method for estimating the tip geometry of scanning ion conductance microscope pipets.
\emph{Anal. Chem.} (in press)
}
\author{Matthew Caldwell}
\details{
Optimisation is performed using the \code{L-BFGS-B} method of \code{\link{optim}}, constraining the possible
values of \code{r} and \code{theta} to physically plausible ranges.
}
\seealso{\code{\link{fit.breakage}}}
\examples{
# fake up some breakage data
brks <- sort(abs(0.5 + rnorm(n=15, sd=0.5) * 1:15))
res <- resist.breakage(brks, theta=3*pi/180, r=0.04, rho=64) + rnorm(15)

# fit it
fit.breakage(list(x=brks, y=res))
}
