% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_cladeAnnotator.R
\name{mod_cladeAnnotator_ui}
\alias{mod_cladeAnnotator_ui}
\alias{mod_cladeAnnotator_server}
\title{mod_cladeAnnotator_ui and mod_cladeAnnotator_server}
\usage{
mod_cladeAnnotator_ui(id)

mod_cladeAnnotator_server(
  input,
  output,
  session,
  mFileMatOut,
  makeTreeOut,
  addTree,
  addAnno,
  removeAnno,
  addMatrix,
  removeMatrix,
  geneObjectForSNP,
  labelOff,
  labColor,
  matOff
)
}
\arguments{
\item{id}{shiny id}

\item{input}{internal}

\item{output}{internal}

\item{session}{internal}
}
\description{
A shiny Module. This module allows the user to add or remove annotations and checks for overlap between those annotaions.
}
\keyword{internal}
