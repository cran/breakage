\name{resist.access}
\alias{resist.access}
\title{Calculate access resistance for a pipette tip}
\description{
Calculates the access resistance for the open pore at the tip of a SICM pipette,
using the approximation due to Hall (1975).
}
\usage{
resist.access(r, rho = 51)
}
\arguments{
  \item{r}{Radius of the pipette tip opening.}
  \item{rho}{Resistivity of the surrounding conductive material, in ohm centimetres. The default value of 51 ohm cm corresponds to a 150 mM solution of KCl.}
}
\value{The calculated access resistance, in ohms.}
\references{Hall, James E. 1975 Access resistance of a small circular pore. \emph{J. Gen. Physiol.}, \bold{66}(4), 531--532}
\author{Matthew Caldwell}
\seealso{\code{\link{resist.access}}, \code{\link{resist.total}}, \code{\link{resist.breakage}}}
\examples{
# access resistance to a 50nm pipette tip in solution of resistivity 64 ohm cm
# converting result from ohms to megohms for readability
resist.access(r=0.05, rho=64) * 1e-6
}