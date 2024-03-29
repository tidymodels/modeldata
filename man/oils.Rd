% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oils.R
\docType{data}
\name{oils}
\alias{oils}
\title{Fatty acid composition of commercial oils}
\source{
Brodnjak-Voncina et al. (2005). Multivariate data analysis in
classification of vegetable oils characterized by the content of fatty
acids, \emph{Chemometrics and Intelligent Laboratory Systems}, Vol.
75:31-45.
}
\value{
\item{oils}{a tibble}
}
\description{
Fatty acid concentrations of commercial oils were measured using gas
chromatography.  The data is used to predict the type of oil.  Note that
only the known oils are in the data set. Also, the authors state that there
are 95 samples of known oils. However, we count 96 in Table 1 (pgs.  33-35).
}
\examples{
data(oils)
str(oils)
}
\keyword{datasets}
