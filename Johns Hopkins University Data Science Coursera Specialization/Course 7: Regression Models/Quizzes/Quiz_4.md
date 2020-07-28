Course 7: Quiz 4
================

## Question 1

Consider the space shuttle data shuttle in the MASS library. Consider
modeling the use of the autolander as the outcome (variable name use).
Fit a logistic regression model with autolander (variable auto) use
(labeled as “auto” 1) versus not (0) as predicted by wind sign (variable
wind). Give the estimated odds ratio for autolander use comparing head
winds, labeled as “head” in the variable headwind (numerator) to tail
winds (denominator).

``` r
library(MASS)
data(shuttle)
shuttle$auto <- 1 * (shuttle$use == "auto")
shuttle$headwind <- 1 * (shuttle$wind == "head")
fit <- glm(auto ~ headwind, data = shuttle, family = binomial)
exp(coef(fit))
```

    ## (Intercept)    headwind 
    ##   1.3272727   0.9686888

## Question 2

Consider the previous problem. Give the estimated odds ratio for
autolander use comparing head winds (numerator) to tail winds
(denominator) adjusting for wind strength from the variable magn.

``` r
fit <- glm(auto ~ headwind + magn, data = shuttle, family = binomial)
exp(coef(fit))
```

    ## (Intercept)    headwind  magnMedium     magnOut  magnStrong 
    ##   1.4851533   0.9684981   1.0000000   0.6841941   0.9376181

## Question 3

If you fit a logistic regression model to a binary variable, for example
use of the autolander, then fit a logistic regression model for one
minus the outcome (not using the autolander) what happens to the
coefficients?

``` r
#Because they are on the log scale, changing the sign changes the numerator and denominator for the exponents as well. Therefore, the coefficients reverse their signs.
```

## Question 4

Consider the insect spray data InsectSprays. Fit a Poisson model using
spray as a factor level. Report the estimated relative rate comparing
spray A (numerator) to spray B (denominator).

``` r
fit <- glm(count ~ relevel(spray, "B"), data = InsectSprays, family = poisson)
exp(coef(fit))[2]
```

    ## relevel(spray, "B")A 
    ##            0.9456522

## Question 5

Consider a Poisson glm with an offset, tt. So, for example, a model of
the form glm(count \~ x + offset(t), family = poisson) where x is a
factor variable comparing a treatment (1) to a control (0) and t is the
natural log of a monitoring time. What is impact of the coefficient for
x if we fit the model glm(count \~ x + offset(t2), family = poisson)
where 2 \<- log(10) + t? In other words, what happens to the
coefficients if we change the units of the offset variable. (Note,
adding log(10) on the log scale is multiplying by 10 on the original
scale.)

``` r
#The coefficients are unchanged, with the exception of the intercept which is shifted by log(10). All of the coefficients are interpreted as log relative rates when holding the other variables or offset constant (again, w/ the exception of the intercept). Thus, a unit change in the offset would cancel out. This is not true of the intercept, which is interpreted as the log rate (not relative rate) with all of the covariates set to 0. Therefore, the coefficient estimate is unchanged.
```

## Question 6

Consider the data

``` r
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
```

Using a knot point at 0, fit a linear model that looks like a hockey
stick with two lines meeting at x=0. Include an intercept term, x and
the knot point term. What is the estimated slope of the line after 0?

``` r
z <- (x > 0) * x
fit <- lm(y ~ x + z)
sum(coef(fit)[2:3])
```

    ## [1] 1.013067
