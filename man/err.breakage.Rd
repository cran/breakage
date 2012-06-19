\name{err.breakage}
\alias{err.breakage}
\title{Error function for estimated tip geometry}
\description{
Calculates the residual sum of squares error between measured resistance
data and the predicted resistances for a given set of model parameters.
}
\usage{
err.breakage(params, data, rho = 51, l = 1000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{params}{
A vector of the 2 tip geometry parameters, where \code{params[1]} is the half-cone angle
in radians, and \code{params[2]} is the initial inner radius in microns.
}
  \item{data}{
The recorded data as an XY list or data frame, where \code{data$x} contains the
breakage distances in microns and \code{data$y} holds the corresponding resistances
in megohms.
}
  \item{rho}{
Resistivity of the filler solution, in ohm centimetres.  The default value of 51 ohm cm corresponds to a 150 mM solution of KCl.
}
  \item{l}{
The initial length of the pipette tip.  Because the resistance is dominated by the narrower tip region, the precise value of this is
not usually important provided it is much greater than the breakage distance.}
}
\details{
This function quantifies the error between a posited model of the pipette tip geometry and
the results actually recorded.  It is organised for minimisation by the standard \code{\link{optim}}
function, and is used as such within \code{\link{fit.breakage}}.  It is not expected to be
much used outside that context.
}
\value{The calculated error value.}
\author{Matthew Caldwell}
\seealso{\code{\link{fit.breakage}}}
\examples{
# estimate breakage data for one geometry
brks <- 0.2 * 0:10
res <- resist.breakage(brks, theta=4*pi/180, r=0.05, rho=62)
dat <- list(x=brks, y=res)

# compare it to different geometry
err.breakage(c(2*pi/180, 0.1), dat, rho=62)
err.breakage(c(6*pi/180, 0.02), dat, rho=62)
}