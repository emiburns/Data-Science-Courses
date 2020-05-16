Getting and Cleaning Data Quiz 2
================

###### Johns Hopkins Data Science Specialization : Course 3 : Week 2 : Quiz

### Question 1

Register an application with the Github API here
<https://github.com/settings/applications>. Access the API to get
information on your instructors repositories (hint: this is the url you
want “<https://api.github.com/users/jtleek/repos>”). Use this data to
find the time that the datasharing repo was created. What time was it
created?

This tutorial may be useful
(<https://github.com/hadley/httr/blob/master/demo/oauth2-github.r>). You
may also need to run the code in the base R package and not R studio.

    ## Answer: 2013-11-07T13:25:07Z

### Question 2

The sqldf package allows for execution of SQL commands on R data frames.
We will use the sqldf package to practice the queries we might send with
the dbSendQuery command in RMySQL.

Download the American Community Survey data and load it into an R object
called: acs.

<https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv>

Which of the following commands will select only the data for the
probability weights pwgtp1 with ages less than 50?

  - sqldf(“select \* from acs where AGEP \< 50”)
  - sqldf(“select \* from acs”)
  - sqldf("select pwgtp1 from acs where AGEP \< 50)
  - sqldf(“select pgwtp1 from acs”)

<!-- end list -->

    ##   pwgtp1
    ## 1     87
    ## 2     88
    ## 3     94
    ## 4     91
    ## 5    539
    ## 6    192

    ## Answer: sqldf('select pwgtp1 from acs where AGEP < 50')

### Question 3

Using the same data frame you created in the previous problem, what is
the equivalent function to unique(acs$AGEP)?

    ## Answer: sqldf('select distinct AGEP from acs')

### Question 4

How many characters are in the 10th, 20th, 30th and 100th lines of HTML
from this page:

<http://biostat.jhsph.edu/~jleek/contact.html>

(Hint: the nchar() function in R may be helpful)

    ## Answer: 4531725

### Question 5

Read this data set into R and report the sum of the numbers in the
fourth of the nine columns.

<https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for>

Original source of the data:
<http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for>

(Hint this is a fixed width file format)

    ##             V1   V2   V3   V4   V5   V6   V7   V8  V9
    ## 1  03JAN1990   23.4 -0.4 25.1 -0.3 26.6  0.0 28.6 0.3
    ## 2  10JAN1990   23.4 -0.8 25.2 -0.3 26.6  0.1 28.6 0.3
    ## 3  17JAN1990   24.2 -0.3 25.3 -0.3 26.5 -0.1 28.6 0.3
    ## 4  24JAN1990   24.4 -0.5 25.5 -0.4 26.5 -0.1 28.4 0.2
    ## 5  31JAN1990   25.1 -0.2 25.8 -0.2 26.7  0.1 28.4 0.2
    ## 6  07FEB1990   25.8  0.2 26.1 -0.1 26.8  0.1 28.4 0.3

    ## Answer: 32426.7
