% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/intra_icc.R
\name{intra_icc}
\alias{intra_icc}
\title{Estimate ICC of a data.frame}
\usage{
intra_icc(x, id.var = c("sample", "analyte"), value.var = "dil.fitted.conc",
    by = NULL, ...)
}
\arguments{
\item{x}{a \code{data.frame} in long format with analyte,
control number and concentration variables}

\item{id.var}{one or more variables that identify each one of
replicates samples}

\item{value.var}{character vector with the name of the variable
to estimate icc}

\item{by}{character vector of the variable to stratify the icc results}

\item{...}{arguments for the \code{icc} function from the \code{irr} package}
}
\value{
A list with three objects is returned:
\itemize{
\item{\code{icc.df}}{, trasnformed \code{data.frame} in
order to perform the icc analysis}
\item{\code{icc.mod}}{, the model output of the icc}
\item{\code{icc.value}}{, the icc value of the icc model}
}
}
\description{
Given a \code{data.frame} in long format
estimate ICC from the \code{irr} package
}
\details{
The \code{\link[irr]{icc}} function is the one from the \code{irr} package.
}
\examples{
# Generate data.frame
set.seed(123)
controls <- sort(paste("Control", rep(1:3,4),sep=""))
values <-  sort(unlist(lapply(1:12, function(x)runif(1,10+x,13+x))))
plateno <- rep(c("plate1","plate2"),6)
df <- data.frame(controls,values, plateno)
df <- df[order(df$plateno),]

# Estimate ICC
intra_icc(df, id.var = c("controls","plateno"),
value.var = "values", type="agreement",model="twoway", unit="single")
intra_icc(df, id.var = c("controls","plateno"),
value.var = "values", by = "plateno", type="agreement",model="twoway",
unit="single")
}
\seealso{
irr
}

