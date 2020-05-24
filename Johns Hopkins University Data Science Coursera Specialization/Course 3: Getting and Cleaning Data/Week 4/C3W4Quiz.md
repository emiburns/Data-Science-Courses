Getting and Cleaning Data Quiz 4
================

###### Johns Hopkins Data Science Specialization : Course 3 : Week 4 : Quiz

### Question 1

The American Community Survey distributes downloadable data about United
States communities. Download the 2006 microdata survey about housing for
the state of Idaho using download.file() from here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv>

and load the data into R. The code book, describing the variable names
is
here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf>

Apply strsplit() to split all the names of the data frame on the
characters “wgtp”. What is the value of the 123 element of the resulting
list?

    ## Answer:  ""   "15"

### Question 2

Load the Gross Domestic Product data for the 190 ranked countries in
this data set:

<https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv>

Remove the commas from the GDP numbers in millions of dollars and
average them. What is the average?

Original data sources:

<http://data.worldbank.org/data-catalog/GDP-ranking-table>

    ## Answer: 377652.42

### Question 3

In the data set from Question 2 what is a regular expression that would
allow you to count the number of countries whose name begins with
“United”? Assume that the variable with the country names in it is
named countryNames. How many countries begin with United?

    ## [1]  1  6 32

    ## Answer: 3

### Question 4

Load the Gross Domestic Product data for the 190 ranked countries in
this data set:

<https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv>

Load the educational data from this data
set:

<https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv>

Match the data based on the country shortcode. Of the countries for
which the end of the fiscal year is available, how many end in June?

Original data sources:

<http://data.worldbank.org/data-catalog/GDP-ranking-table>

<http://data.worldbank.org/data-catalog/ed-stats>

    ##  [1]   9  16  29  51  65  89  96 133 140 152 159 175 189

    ## Answer: 13

### Question 5

You can use the quantmod (<http://www.quantmod.com/>) package to get
historical stock prices for publicly traded companies on the NASDAQ and
NYSE. Use the following code to download data on Amazon’s stock price
and get the times the data was sampled:

*library(quantmod) amzn = getSymbols(“AMZN”,auto.assign=FALSE)
sampleTimes = index(amzn)*

How many values were collected in 2012? How many values were collected
on Mondays in 2012?

    ## Answer: 250, 47
