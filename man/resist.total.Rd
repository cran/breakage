\name{resist.total}
\alias{resist.total}
\title{Calculate overall pipette tip resistance}
\description{
Calculates the resistance of a pipette tip, as the sum of its internal conical resistance and
external access resistance.  Pipette geometry is specified in terms of length, tip radius and
half-cone angle.}
\usage{
resist.total(r, l, theta, rho = 51)
}
\arguments{
  \item{r}{Pipette tip (inner) radius, in microns.}
  \item{l}{
Pipette length, in microns.  Note that resistance contribution falls of markedly away from the tip, so
the exact length may not be crucially important.}
  \item{theta}{Pipette internal half-cone angle, in radians.}
  \item{rho}{Resistivity of the pipette filler medium, in ohm centimetres.  The default value of 51 ohm cm corresponds to a 150 mM solution of KCl.}
}
\value{The calculated total resistance, in ohms.}
\author{
Matthew Caldwell
}
\seealso{\code{\link{resist.access}}, \code{\link{resist.cone}}, \code{\link{resist.breakage}}}
\examples{
# total resistance for a 30 micron long pipette tip with a half-cone angle of 4 degrees
# and a tip radius of 50nm, with a filler/bath resistivity of 62 ohm cm
# converting result from ohms to megohms for readability
resist.total(r=0.05, l=30, theta=4*pi/180, rho=62) * 1e-6
}