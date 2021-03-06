% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pRolocVis.R, R/pRolocVis_classify.R, R/pRolocVis_compare.R, R/pRolocVis_pca.R
\name{pRolocVis}
\alias{pRolocVis}
\alias{pRolocVis_classify}
\alias{pRolocVis_compare}
\alias{pRolocVis_pca}
\title{Interactive visualisation of spatial proteomics data}
\usage{
pRolocVis(object, app, fcol, legend.cex = 1, ...)

pRolocVis_classify(object, fcol, scol, mcol = "markers", legend.cex = 1,
  ...)

pRolocVis_compare(object, fcol1, fcol2, foi, fig.height = "600px",
  fig.width = "100\%", legend.width = "200\%", legend.cex = 1,
  remap = TRUE, nchar = 40, all = TRUE, ...)

pRolocVis_pca(object, fcol, foi, fig.height = "600px", fig.width = "100\%",
  legend.width = "200\%", legend.cex = 1, nchar = 40, all = TRUE, ...)
}
\arguments{
\item{object}{An instance of class \code{MSnSet}, or an \code{MSnSetList}
of length 2 if using \code{"compare"} application.}

\item{app}{The type of application requested: \code{"main"}
(default), \code{"classify"}, \code{"compare"}.See description
below.}

\item{fcol}{The feature meta-data label (fData column name). This
will correspond to the prediction column if using "classify",
or the markers (labelled data) to be plotted otherwise.}

\item{legend.cex}{Point character expansion for the the legend.
Default is 1.}

\item{...}{Additional parameters passed to the respective app.}

\item{scol}{The feature meta data column containing the 
classification scores.}

\item{mcol}{The feature meta data column containing the labelled training 
data, for use with "classify".}

\item{fcol1}{If using the \code{compare} app this is the feature meta-data 
label (fData column name) for the first dataset in the \code{MSnSetList}. 
Default is \code{markers}.}

\item{fcol2}{If using the \code{compare} app this is the feature meta-data 
label (fData column name) for the second dataset in the \code{MSnSetList}. 
Default is \code{markers}.}

\item{foi}{A \code{\link{FeaturesOfInterest}} or 
\code{\link{FoICollection}} object.}

\item{fig.height}{Height of the figure. Default is \code{"600px"}.}

\item{fig.width}{Width of the figure. Default is \code{"100px"}.}

\item{legend.width}{Width of the legend. Default is \code{"200\%"}.}

\item{remap}{A \code{logical} indicating whether the second dataset in the
\code{MSnSetList} should be remapped to the first dataset. Default is}

\item{nchar}{Maximum number of characters of the markers class
names, before their names are truncated. Default is 10.}

\item{all}{If \code{TRUE} all clusters are displayed on startup, if the
total number of clusters is less than including 15. If \code{FALSE} 
or otherwise, only the first cluster in the list is displayed.}
}
\value{
For \code{classify} a \code{numeric} vector of thresholds, 
one per class, to use with \code{\link{getPredictions}}

For \code{compare} and \code{main} a \code{character} vector of the 
\code{featureNames} of the proteins selected is invisibly returned.

For \code{pca} a \code{character} of protein names, of the 
proteins selected upon application closure.
}
\description{
These functions allow one to explore spatial proteomics data
interactively.
}
\details{
The function \code{pRolocVis} is a wrapper for
\code{pRolocVis_main}, \code{pRolocVis_classify} and
\code{pRolocVis_compare}. These Shiny apps allow to explore and
analyse interactively spatial proteomics data.
 
The \code{main} Shiny app allows exploration of quantitative data
(1) visually through Principle Component Analysis (PCA), (2)
protein profiles, and (3) a searchable feature data table,
allowing visualisation of particular proteins of interest.

The \code{classify} Shiny app is used to visualise classification
results and set user-specified thresholds for sub-cellular
location predictions.

The \code{compare} Shiny app is meant for comparing protein
localisation between two conditions, or two different experiments,
replicates etc. Please note that passing the argument \code{method} 
to \code{...} will not work as it is already specified internally.
}
\examples{
library("pRoloc")
library("pRolocdata")
data(hyperLOPIT2015)
if (interactive()) {
  pRolocVis(hyperLOPIT2015)
}
## Load classification results from hyperLOPIT stored in fData
if (interactive()) {
  myThreshold <- pRolocVis(hyperLOPIT2015, app = "classify", 
                           fcol = "svm.classification", 
                           scol = "svm.score")
  newPredictions <- getPredictions(hyperLOPIT2015, fcol = "svm.classification", 
                                   scol = "svm.score", t = myThreshold)
}
}
\author{
Laurent Gatto, Lisa Breckels and Thomas Naake
}
\seealso{
The package vignette: \code{vignette("pRolocGUI")}.
}

