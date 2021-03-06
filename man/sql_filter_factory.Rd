% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sql_filter_factory.R
\name{sql_filter_factory}
\alias{sql_filter_factory}
\title{Create a DT funcFilter for SQL connections.}
\usage{
sql_filter_factory(con, query_fun, ...)
}
\arguments{
\item{con}{DBI database connection for \code{query_fun} to use.}

\item{query_fun}{function that takes \code{con} and \code{params} parameters
and returns payload for a datatable. See \code{query_sqlite} for an example.}

\item{...}{Additional arguments passed to \code{query_fun}.}
}
\value{
function conforming to a DT funcFilter interface.
}
\description{
Given a DBI connection and a query function return a funcFilter function
as required by DT::renderDT.
}
\details{
The main purpose of this function is to keep a reference to the database
connection so as to prevent the need to set up a new connection every time
data is accessed by the funcFilter.

It also allows for different implementations of \code{query_fun} so as not
to be limited to just the current sqlite implementation.
}
\examples{
\dontrun{
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbWriteTable(con, "mtcars", mtcars)
myFuncFilter <- sql_filter_factory(con, query_sqlite, tbl = "mtcars")
}
}
