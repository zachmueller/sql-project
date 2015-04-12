# Create stock price data series (use S&P500 over X previous years as baseline for market fluctuations, give stock beta of 1.X, maybe contact Sweet for help on how to simulate a stock's price movement this way)
# --->vector of S&P500 % changes, duplicate into new vector and multiple % changes by chosen Beta, randomly miss that Beta-adjusted vector by roughly +/-7bps, choose starting price then apply % change vector
# Create list of employees (with first/last names, department, title, level, hire date, etc.) [total employee count should grow over time, include term dates]
# Create vector of grant dates (options usually granted across the company in bulk)
# Create data.table of granted options, issuing only to employees hired and not terminated by that date, and issuing number of options based on employee level


# load necessary libraries
library("data.table");
library("lubridate");
library("ggplot2");

library("RODBC");
library("xlsx");
library("quantmod");
####
#### find package that has truncrnorm()
####



#####################################################################
##	Create stock price using input market data (S&P500)
#####################################################################
# set input variables
start.price <- 10.0;
beta <- 1.2;
beta.miss <- 0.0007;
start.date <- as.Date("1990-01-01");
months.pricing.data <- 25 * 12;


# import market csv file
setwd('C:/Users/zmueller/Documents/GitHub/sql-project/');
file.name <- 'data/stock-market/S&P500.csv';
# load csv into data.table
market <- data.table(read.csv(file.name));
# convert Date field to date type
market[, Date:=as.Date(Date)];
# set the key to order the data.table data
setkey(market, Date);
# remove the extraneous columns
market[, Open:=NULL];
market[, High:=NULL];
market[, Low:=NULL];
market[, Close:=NULL];
market[, Volume:=NULL];
# add in prior date's price and % change day over day
market[, Prior.Close:=c(0, Adj.Close[-.N])];
market[, Pct.Change:=((Adj.Close - Prior.Close)/Prior.Close)];

# extract relevant date range from market data
date.range <- seq(from = start.date, to = (start.date +
	months(months.pricing.data) - 1), by = "1 day");
stock <- market[J(date.range), nomatch=FALSE]; # use nomatch to filter to only dates with market data
# remove extra columns
stock[, Adj.Close:=NULL];
stock[, Prior.Close:=NULL];


# use stock market price data and input Beta to back into a stock price
##	multiply the market % change by the input Beta,
##	using a random factor of "missing" a perfect Beta
stock[, Pct.Change.B:=Pct.Change * beta 
	+ rnorm(stock[,.N], mean = 0, sd = beta.miss)];
# add in starting stock price
##	set randomly around start.price by roughly 5%
stock[, price:=rnorm(1, mean = start.price, sd = 0.05)];
# calculate the cumulative product of the Beta-adjusted percent changes
stock[, Pct.Change.CumProd:=cumprod(1 + Pct.Change.B)];
# multiply the cumulative product output by the starting stock price
stock[, price:=Pct.Change.CumProd * price];
# show a quick plot of the data
qplot(stock[,Date], stock[,price]);
# remove extra columns
stock[, pct.change:=Pct.Change.B];
stock[, Pct.Change:=NULL];
stock[, Pct.Change.B:=NULL];
stock[, Pct.Change.CumProd:=NULL];



#####################################################################
##	Create fictitious list of employees, using First and Last name lists
#####################################################################
# import first and last name lists from csv files
setwd('C:/Users/zmueller/Documents/GitHub/sql-project/');
file.name <- 'data/lists/CSV_Database_of_First_Names.csv';
first.names <- data.table(read.csv(file.name));
file.name <- 'data/lists/CSV_Database_of_Last_Names.csv';
last.names <- data.table(read.csv(file.name));

# set inputs
start.headcount <- 10;
end.headcount <- 1000;
company.start.date <- as.Date("1985-01-01");

# add some randomization to the inputs
start.headcount <- round(rnorm(1, mean = start.headcount, sd = (start.headcount * 0.15)));
end.headcount <- round(rnorm(1, mean = end.headcount, sd = (end.headcount * 0.05)));
company.start.date <- company.start.date + round(rnorm(1, mean = 0, sd = 60), 0);


# create data.table of employees, randomly selecting from both first and last names
employees <- data.table(first.name = sample(first.names[, firstname],
	end.headcount, replace=TRUE), last.name = sample(last.names[, lastname],
	end.headcount, replace=TRUE));
# choose a random set (around years * 8) of dates between company.start.date and
##	the end date as batch hiring days.
end.date <- max(stock[, Date]);
hire.days <- round(rnorm(1, mean = (as.integer(end.date
	- company.start.date) / 365) * 8, sd = 10), 0);
hiring.dates <- sample(seq(from = company.start.date,
	to = end.date, by = "1 day"), hire.days);
hiring <- data.table(Date = hiring.dates);
setkey(hiring, Date);
hiring[, I:=.I];
hiring[stock, roll=TRUE][, sum(price), by = I];

##	Then, using the stock price data as a proxy, fill
##	in each employee's hiring date as one of the hiring dates
##	randomly selected above
####	Area under curve between current/prior hire dates as percent of total area under curve?
