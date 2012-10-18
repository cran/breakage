\name{break.clust}
\alias{break.clust}
\title{
Manually select point clusters from breakage data
}
\description{
Plots the supplied position-resistance data and allows individual clusters to be
selected graphically. A data frame of the median breakage distances and resistances
for the selected clusters is returned.
}
\usage{
break.clust(data, zero.invert = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
A data frame including \code{Z} and \code{Mohm} columns, as returned by \code{\link{breakage.plot}}.
}
  \item{zero.invert}{
Whether to convert to the \code{Z} positional data to breakage distance. See Details for more information.
}
}
\details{
Point clusters are chosen using the Imap \code{\link{select.pts}} function. A cluster is selected by
clicking points around it to draw a polygon. Right-click to close the polygon and define the cluster.
To finish selecting, draw a polygon that encloses no points.

The recorded positional information is typically in terms of the piezo used to position the pipette.
Model fitting, on the other hand, is done in terms of the breakage distance, i.e. measuring away
from the unbroken pipette tip. We can convert from one to the other by taking the most extended
surface position as that corresponding to the unbroken tip and substracting subsequent surface
positions to determine the length of the broken off region, and this is done by default.

Where data have been collected in more than one pass, with possible positional changes in between,
the results from each pass must be aligned together. It may be more convenient to do this in the
context of the full position, and then convert to breakage distance afterward.
}
\value{
\item{Z}{The median position for each cluster, in microns. Values are optionally offset from the maximum tip position, as described above.}
\item{Mohm}{The median resistance for each cluster, in megohms.}
}
\references{
Caldwell, M., Del Linz, S. J. L., Smart, T. G. S. and Moss, G. W. J. 2012
Method for estimating the tip geometry of scanning ion conductance microscope pipets.
\emph{Anal. Chem.} (in press)
}
\author{
Matthew Caldwell
}

\seealso{\code{\link{breakage.plot}}, \code{\link{fit.breakage}}}
\examples{
# load the example data set
data("break.data")

# get the bottom points
raw.points <- breakage.plot( break.data, mV=100 )
\donttest{
# select the clusters
clustered <- break.clust( raw.points )
}
}