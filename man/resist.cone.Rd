\name{resist.cone}
\alias{resist.cone}
\title{Calculate resistance of a truncated conical conductor}
\description{Calculates the resistance of a truncated conical volume
of material of known resistivity.}
\usage{
resist.cone(l, r1, r2, rho = 51)
}
\arguments{
  \item{l}{Length of the truncated cone, in microns.}
  \item{r1}{Radius of one end of the truncated cone, in microns.}
  \item{r2}{Radius of the other end of the truncated cone, in microns.}
  \item{rho}{Resistivity of the conductive material, in ohm centimetres.  The default value of 51 ohm cm corresponds to a 150 mM solution of KCl.}
}
\value{Calculated resistance, in ohms.}
\author{Matthew Caldwell}
\note{A \code{NaN} result will be produced if \code{r1==r2}.}
\seealso{\code{\link{resist.access}}, \code{\link{resist.total}}, \code{\link{resist.breakage}}}
\examples{
# resistance of truncated conical segment 30 microns long, with end radii 50nm and 500nm
# filled with solution of resistivity 62 ohm cm
# converting result from ohms to megohms for readability
resist.cone(l=30, r1=0.05, r2=0.5, rho=62) * 1e-6
}