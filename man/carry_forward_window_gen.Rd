% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/windows.r
\name{carry_forward_window_gen}
\alias{carry_forward_window_gen}
\title{Create a sliding window iterator generator}
\usage{
carry_forward_window_gen(sorted_times, interval, skip = 1)
}
\arguments{
\item{sorted_times}{a vector of date-times in ascending order.}

\item{interval}{a time interval. The default is minutes(5).}

\item{skip}{elements on the interval.}
}
\value{
an iterator that, when called with nextElem returns the indices
in the next window. If there is only one value in the window the last
valid index is returned as the first. This allows for carrying prices
forward when transactions are sparse in time.
data(aapl_fix)
aapl_fix$dt_string = paste(aapl_fix$sys_date, aapl_fix$sys_time)
aapl_fix$dt = strptime(aapl_fix$dt_string, "%Y-%m-%d %H:%M:%OS")
it = carry_forward_window_gen(aapl_fix$dt)
window1 = nextElem(it)
aapl_fix$dt[c(window1[1], tail(window1, 1)]
window2 = nextElem(it)
aapl_fix$dt[c(window2[1], tail(window2, 1)]
}
\description{
Create a sliding window iterator generator
}

