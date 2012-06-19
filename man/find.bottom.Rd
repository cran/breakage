\name{find.bottom}
\alias{find.bottom}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Identify the bottom points in a hopping-mode position trace}
\description{
Identifies the bottom points of each approach in a positional trace from a scanning ion
conductance probe operating in hopping mode.
}
\usage{
find.bottom(x, window = 50, box.size = 9, clip.ends=TRUE)
}
\arguments{
  \item{x}{
A vector of positions recorded over time. Positions are taken to be measured
\emph{upward{}}, i.e. a higher value corresponds to a higher probe position further
from the sample. Units are unspecified.
}
  \item{window}{
Minimum number of previous descending points before a bottom point is accepted. This
allows positional wobbles at the bottom and top of a hop to be ignored.
}
  \item{box.size}{
Width (in samples) of a simple box filter to apply in order to smooth the signal
before searching for minima.
}
  \item{clip.ends}{
Whether to omit bottom points discovered within \code{window} points from the end
of the signal. This avoids mis-identifying a \emph{de facto} minimum at the
end of the signal as being an actual bottom point. \code{TRUE} by default.
}
}
\value{
A logical vector the same length as the input vector \code{x}, with the bottom points
set to \code{TRUE} and all others \code{FALSE}.
}
\author{Matthew Caldwell}
\examples{
# use a simple sine wave as an example signal
t <- 1:1000
hops <- sin(t * pi/100)

# find the bottom points
bots <- find.bottom(hops)

# plot the result
plot(hops, type="l")
abline(v=t[bots], col=2)
}
