\name{resist.breakage}
\alias{resist.breakage}
\title{Calculate resistance of a pipette tip after breakage}
\description{
Calculates the total resistance of a pipette tip, given its initial geometry and
the length of a segment broken off the tip.
}
\usage{
resist.breakage(x, theta, r, rho = 51, l = 1000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{The length of the broken off segment, in microns.}
  \item{theta}{Pipette internal half-cone angle, in radians.}
  \item{r}{Pipette initial tip radius, in microns.}
  \item{rho}{Resistivity of the pipette filler medium, in ohm centimetres. The default value of 51 ohm cm corresponds to a 150 mM solution of KCl.}
  \item{l}{The initial length of the pipette tip.  Because the resistance is dominated by the narrower tip region, the precise value of this is
not usually important provided it is much greater than the breakage distance.}
}
\details{
Pipette resistance is calculated exactly as for \code{resist.total}, after first adjusting the geometry for
the broken region.  This rearrangement in terms of breakage distance is convenient for fitting resistance
changes resulting from a sequence of breaks caused by overshooting the detection range in hopping mode
SICM.  (See referenced paper for more details.)
}
\value{The calculated resistance, in megohms.  Note that conversion from ohms is done automatically here.}
\references{
Caldwell, M., Del Linz, S. J. L., Smart, T. G. S. and Moss, G. W. J. 2012
Method for estimating the tip geometry of scanning ion conductance microscope pipets.
\emph{Anal. Chem.} 84(21):8980--8984
}
\author{Matthew Caldwell}
\seealso{\code{\link{resist.access}}, \code{\link{resist.cone}}, \code{\link{resist.total}}}
\examples{
# specify a range of breakage distances in 100 nm steps
brks <- 0.1 * 0:150

# calculate corresponding resistances for a pipette with initial
# tip radius 50nm, half-cone angle 4 degrees, length 1mm
# and filler resistivity 64 ohm cm
res <- resist.breakage(brks, theta=4*pi/180, r=0.05, rho=64)

# plot the predicted curve of resistance against breakage
plot(res ~ brks, type="l", ylim=c(0, max(res)),
     ylab="Resistance (Mohm)", xlab="Breakage Distance (um)")
}