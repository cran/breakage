\name{breakage-package}
\alias{breakage-package}
\alias{breakage}
\docType{package}
\title{
Estimating SICM pipette tip geometry from breakage data
}
\description{
Functions to estimate the interior half-cone angle and tip radius of a scanning
ion conductance microscope (SICM) pipette by fitting recorded changes in pipette
conductance as the pipette tip is broken. See the referenced paper for a full
discussion of this technique.
}
\details{
\tabular{ll}{
Package: \tab breakage\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2014-12-08\cr
License: \tab Artistic 2.0\cr
LazyLoad: \tab yes\cr
}
}
\author{
Matthew Caldwell <m.caldwell@ucl.ac.uk>
}
\references{
Caldwell, M., Del Linz, S. J. L., Smart, T. G. S. and Moss, G. W. J. 2012
Method for estimating the tip geometry of scanning ion conductance microscope pipets.
\emph{Anal. Chem.} 84(21):8980--8984
}
\keyword{ package }
\examples{
# load the example data set
data("break.data")

# get the bottom points
raw.points <- breakage.plot(break.data, mV=100)
\dontrun{
# select the clusters
clustered <- break.clust(raw.points)

# fit the tip geometry to the clustered points
fit <- fit.breakage(clustered, rho=64)
}
}
