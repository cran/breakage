\name{break.data}
\alias{break.data}
\docType{data}
\title{
Sample recording of SICM pipette breakage
}
\description{
Position and current data recorded using a scanning ion conductance microscope
in hopping mode. An elevated fall rate drove the pipette to overshoot its detection
range and collide with the cover slip surface and break, altering its resistance.
}
\usage{data(break.data)}
\format{
  A data frame with 9999 observations on the following 3 variables.
  \describe{
    \item{\code{s}}{The time of each data point, in milliseconds from the start of the recording.}
    \item{\code{pA}}{The ion current passing through the pipette, in picoamps.}
    \item{\code{Z}}{The pipette position, in microns, recorded within the frame of reference of the SICM piezo actuator.}
  }
}
\source{
Caldwell, M., Del Linz, S. J. L., Novak, P., Korchev Y. E., Smart, T. G. S. and Moss G. W. J. 2012
A simple method for estimating the tip geometry of scanning ion conductance microscope pipettes.
\emph{Anal. Chem.} (in press)
}
\examples{
data(break.data)
plot(pA ~ s, data=break.data, type="l")
plot(Z ~ s, data=break.data, type="l")
}
\keyword{datasets}
