Course 6: Quiz 1
================

## Question 1

Consider influenza epidemics for two parent heterosexual families.
Suppose that the probability is 17% that at least one of the parents has
contracted the disease. The probability that the father has contracted
influenza is 12% while the probability that both the mother and father
have contracted the disease is 6%. What is the probability that the
mother has contracted influenza?

(Hints look at lecture 2 around 5:30 and chapter 4 problem 4).

  - 17%
  - 6%
  - 11%
  - 5%

<!-- end list -->

``` r
#if we assume A = mother & B = Father then P(A∪B) = P(A) + P(B) − P(A∩B) and P(B) = P(A∩B) + P(A∪B) - P(A)

P_AUB <- 17
P_B <- 12
P_AnB <- 6

P_A <- -(P_B - P_AnB - P_AUB)
P_A
```

    ## [1] 11

## Question 2

A random variable, XX is uniform, a box from 0 to 1 of height 1. (So
that its density is f(x) = 1 for 10≤x≤1) What is its 75th percentile?

(Hints, look at lecture 2 around 21:30 and Chapter 5 Problem 5. Also,
look up the help function for the qunif command in R.)

*.1 *.25 *.50 *.75

``` r
#we'll want to use the qunif() function since the variable is uniformly distributed on a given interval
qunif(.75, min = 0, max = 1)
```

    ## [1] 0.75

## Question 3

You are playing a game with a friend where you flip a coin and if it
comes up heads you give her XX dollars and if it comes up tails she
gives you YY dollars. The probability that the coin is heads is pp (some
number between 00 and 11.) What has to be true about XX and YY to make
so that both of your expected total earnings is 00. The game would then
be called “fair”.

(Hints, look at Lecture 4 from 0 to 6:50 and Chapter 5 Problem 6. Also,
for further reading on fair games and gambling, start with the Dutch
Book problem).

  - X = Y
  - p = X/Y
  - p/(1−p) = X/Y
  - p/(1−p) = Y/X

<!-- end list -->

``` r
#expected earnings: -pX+(1-p)Y = 0
# this means pX = Y(1-p) and then p/(1-p) = Y/X
```

## Question 4

A density that looks like a normal density (but may or may not be
exactly normal) is exactly symmetric about zero. (Symmetric means if you
flip it around zero it looks the same.) What is its median?

(Hints, look at quantiles from Lecture 2 around 21:30 and Chapter 2
Problem 7).

*We can’t conclude anything about the median. *The median must be
different from the mean. *The median must be 1. *The median must be 0.

``` r
#The median must be 0 since it is exactly symmetric around 0, meaning that 50% of the mass is below 0 and 50% is above
```

## Question 5

Consider the following PMF shown below in R

``` r
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp
```

    ##      [,1] [,2] [,3] [,4]
    ## X     1.0  2.0  3.0  4.0
    ## Prob  0.1  0.2  0.3  0.4

``` r
## [,1] [,2] [,3] [,4]
## X 1.0 2.0 3.0 4.0
## Prob 0.1 0.2 0.3 0.4
```

What is the mean?

(Hint, watch Lecture 4 on expectations of PMFs)

*1 *3 *2 *4

``` r
fi <- temp["X",]
xi <- temp["Prob",] 
  
mean <- fi*xi
sum(mean)
```

    ## [1] 3

## Question 6

A web site (www.medicine.ox.ac.uk/bandolier/band64/b64-7.html) for home
pregnancy tests cites the following: “When the subjects using the test
were women who collected and tested their own samples, the overall
sensitivity was 75%. Specificity was also low, in the range 52% to 75%.”
Assume the lower value for the specificity. Suppose a subject has a
positive test and that 30% of women taking pregnancy tests are actually
pregnant. What number is closest to the probability of pregnancy given
the positive test?

(Hints, watch Lecture 3 at around 7 minutes for a similar example. Also,
there’s a lot of Bayes’ rule problems and descriptions out there, for
example here’s one for HIV testing. Note, discussions of Bayes’ rule can
get pretty heady. So if it’s new to you, stick to basic treatments of
the problem. Also see Chapter 3 Question 5.)

*20% *10% *40% *30%

``` r
#P(Preg|+) = P(+|Preg)P(Preg) / P(+|Preg)P(Preg)+P(+|Preg^c)P(Preg^c)

P_Preg_Pos <- 0.75*0.30/(0.75*0.30+0.48*0.70)
P_Preg_Pos
```

    ## [1] 0.4010695
