% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/utilities.r
\name{log_rate_returns}
\alias{log_rate_returns}
\title{Get the log-rate-returns of a time-series}
\usage{
log_rate_returns(x, na.omit = TRUE)
}
\arguments{
\item{prices}{the values to calculated the log-rate returns from.}
}
\description{
Get the log-rate-returns of a time-series
}
\examples{
data(aapl_fix)
data(a_fix)
aapl_cons = consolidate_prices(aapl_fix$sys_date, aapl_fix$sys_time,
 aapl_fix$td_price, aapl_fix$td_size)
a_cons = consolidate_prices(a_fix$sys_date, a_fix$sys_time,
 a_fix$td_price, a_fix$td_size)
trades = merge(aapl_cons$price, a_cons$price)
trades = carry_prices_forward(trades)
trade_llr = log_rate_returns(trades)
names(trades_lrr) = c("aapl", "a")
cointegration_p_matrix(trades_lrr)
}

