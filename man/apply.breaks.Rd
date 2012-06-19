\name{apply.breaks}
\alias{apply.breaks}
\title{
Apply a function to regions of a signal
}
\description{
Applies a specified function to sections of an input signal in between specified index
points. The indices can be supplied explicitly in the \code{idx} parameter, or as the
logical vector \code{btm} in which the divider points are set to \code{TRUE}. By default,
the \code{link{median}} of each segment is calculated.
}
\usage{
apply.breaks(x, btm = NULL, f = median, idx = (1:length(btm))[btm])
}
\arguments{
  \item{x}{
The data vector whose segments are to be processed.
}
  \item{btm}{
A logical vector containing \code{TRUE} at the points where the data in \code{x}
should be split into segments. Either this or \code{idx} must be provided.
}
  \item{f}{
A function object to apply to each segment of data. Should return a single value.
The default is to use the \code{median} function.
}
  \item{idx}{
A vector of indices at which the data vector should be split into segments. The data
at the index is not included in the segment. Either this or \code{btm} must be provided.
}
}
\details{
Unbounded stretches at each end are dropped, as are empty regions (i.e. regions between adjacent
dividers). Thus, if there are \code{N} divider points there will be at most \code{N-1} returned
values (and possibly fewer).}
\value{
A vector containing the function results for each non-empty segment.
}
\author{
Matthew Caldwell
}
\seealso{\code{\link{find.bottom}}}
\examples{
x <- rnorm(500)
apply.breaks(x, idx=50 * 1:10)
}
