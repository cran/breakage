\name{breakage.plot}
\alias{breakage.plot}
\title{
Plot a pipette breakage current or resistance relationship
}
\description{
Calculates and plots a current-distance or resistance-distance relation from
recorded current-position data during pipette tip breakage.
}
\usage{
breakage.plot(x, time.limits = NULL, btm = find.bottom(x$Z),
    pch = 16, col = 1, lty = "solid", col.l = 2,
    plot.line = FALSE, f = median, mV = NA, ...)
}
\arguments{
  \item{x}{
A data frame containing the experimental current and position traces. The frame should include a
column named \code{Z}, containing the position in microns, and a column named \code{pA}, containing
the recorded current in picoamps. If the \code{time.limits} parameter is specified, there must also
be a column named \code{s} containing time information (typically in seconds, although the units are
not used).
}
  \item{time.limits}{
An optional 2-element vector specifying lower and upper bounds in the \code{s} column of data to
which the processing should be constrained.
}
  \item{btm}{
An optional vector of division points breaking the signal into segments. Typically this is obtained
from the \code{Z} data by calling \code{\link{find.bottom}}.
}
  \item{pch}{
Symbol to use for plotting individual current/resistance measurements.
}
  \item{col}{
Colour to use for plotting the current/resistance points.
}
  \item{lty}{
Line type to use for plotting a regression line.
}
  \item{col.l}{
Colour to use for plotting a regression line.
}
  \item{plot.line}{
Whether to plot a regression line. By default this is not done, as a linear regression line
corresponds poorly to the resistance behaviour. It may be a useful rough indicator when plotting
only current data.
}
  \item{f}{
Function to use for determining the current between hops. By default the \code{median} is used, but
in some cases it may make sense to use a different measure.
}
  \item{mV}{
The pipette potential at which the data were recorded. If not supplied, resistance cannot be
calculated and the current data are graphed directly.
}
  \item{\dots}{
Other graphical parameters to be passed to the \code{\link{plot}} function.
}
}
\value{
  \item{Z}{The identified bottom of hop positions, in microns.}
  \item{pA}{The corresponding median (or other) current through the withdrawn pipette, in picoamps.}
  \item{Mohm}{The calculated pipette resistance in megohms. (Only present if \code{mV} was supplied.)}
}
\references{
Caldwell, M., Del Linz, S. J. L., Smart, T. G. S. and Moss, G. W. J. 2012
Method for estimating the tip geometry of scanning ion conductance microscope pipets.
\emph{Anal. Chem.} (in press)
}
\author{
Matthew Caldwell
}

\seealso{
\code{\link{find.bottom}}
}
\examples{
# load the example data set
data("break.data")
breakage.plot(break.data, mV=100)
}
