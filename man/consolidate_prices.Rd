% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/process.R
\name{consolidate_prices}
\alias{consolidate_prices}
\title{Consolidate prices at a specified resolution}
\usage{
consolidate_prices(date, time, price, size, date_format = "\%Y-\%m-\%d",
  time_format = "\%H:\%M:\%OS", on = "seconds", k = 1)
}
\arguments{
\item{date}{transaction date strings}

\item{time}{transaction time strings}

\item{price}{a tranaction prices}

\item{size}{a transaction sizes}

\item{date_format}{the format for the sys_date column
(default is "\%Y-\%m-\%d").}

\item{time_format}{the format for the sys_time column
(default is "\%H:\%M:\%S.\%f").}

\item{on}{the resolution to consolidate trades. The default is "seconds"
and any resolution supported by the xts::endpoints function is valid.}

\item{k}{along every k-th elements. For example if "seconds" is specified
as the "on" parameter and k=2 then prices are consolidated for every 2
seconds.}
}
\value{
an xts object with (vwapped) price, max price, min price, and volume.
}
\description{
Consolidate prices at a specified resolution
}
\examples{
# Consolidate TAQ trades...
data(aapl_taq)
ctp = consolidate_prices(aapl_taq$sys_date, aapl_taq$sys_time,
 aapl_taq$td_price, aapl_taq$td_size, date_format="\%Y\%m\%d",
 time_format="\%H:\%M:\%S")
# or FIX trades...
data(aapl_fix)
cfp = consolidate_prices(aapl_fix$sys_date, aapl_fix$sys_time,
 aapl_fix$td_price, aapl_fix$td_size)
}

