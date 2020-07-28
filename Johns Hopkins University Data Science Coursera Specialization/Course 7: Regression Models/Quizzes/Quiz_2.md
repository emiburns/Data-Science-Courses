Course 7: Quiz 2
================

## Question 1

Consider the following data with x as the predictor and y as as the
outcome.

``` r
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
```

Give a P-value for the two sided hypothesis test of whether β1 from a
linear regression model is 0 or not.

``` r
summary(lm(y ~ x))$coef
```

    ##              Estimate Std. Error   t value   Pr(>|t|)
    ## (Intercept) 0.1884572  0.2061290 0.9142681 0.39098029
    ## x           0.7224211  0.3106531 2.3254912 0.05296439

## Question 2

Consider the previous problem, give the estimate of the residual
standard deviation.

``` r
summary(lm(y ~ x))$sigma
```

    ## [1] 0.2229981

## Question 3

In the mtcars data set, fit a linear regression model of weight
(predictor) on mpg (outcome). Get a 95% confidence interval for the
expected mpg at the average weight. What is the lower endpoint?

``` r
data(mtcars)
fit <- lm(mpg ~ I(wt - mean(wt)), data = mtcars)
confint(fit)
```

    ##                      2.5 %    97.5 %
    ## (Intercept)      18.990982 21.190268
    ## I(wt - mean(wt)) -6.486308 -4.202635

## Question 4

Refer to the previous question. Read the help file for mtcars. What is
the weight coefficient interpreted as?

``` r
#The estimated expected change in mpg per 1,000 lb increase in weight.
```

## Question 5

Consider again the mtcars data set and a linear regression model with
mpg as predicted by weight (1,000 lbs). A new car is coming weighing
3000 pounds. Construct a 95% prediction interval for its mpg. What is
the upper endpoint?

``` r
predict(fit, data = data.frame(x = 3), interval = ("prediction"))
```

    ## Warning in predict.lm(fit, data = data.frame(x = 3), interval = ("prediction")): predictions on current data refer to _future_ responses

    ##                           fit       lwr      upr
    ## Mazda RX4           23.282611 16.928937 29.63628
    ## Mazda RX4 Wag       21.919770 15.590725 28.24882
    ## Datsun 710          24.885952 18.486442 31.28546
    ## Hornet 4 Drive      20.102650 13.785680 26.41962
    ## Hornet Sportabout   18.900144 12.578057 25.22223
    ## Valiant             18.793255 12.470207 25.11630
    ## Duster 360          18.205363 11.875565 24.53516
    ## Merc 240D           20.236262 13.919216 26.55331
    ## Merc 230            20.450041 14.132605 26.76748
    ## Merc 280            18.900144 12.578057 25.22223
    ## Merc 280C           18.900144 12.578057 25.22223
    ## Merc 450SE          15.533127  9.141555 21.92470
    ## Merc 450SL          17.350247 11.006204 23.69429
    ## Merc 450SLC         17.083024 10.733457 23.43259
    ## Cadillac Fleetwood   9.226650  2.496758 15.95654
    ## Lincoln Continental  8.296712  1.495740 15.09769
    ## Chrysler Imperial    8.718926  1.950855 15.48700
    ## Fiat 128            25.527289 19.104419 31.95016
    ## Honda Civic         28.653805 22.077240 35.23037
    ## Toyota Corolla      27.478021 20.966866 33.98918
    ## Toyota Corona       24.111004 17.735905 30.48610
    ## Dodge Challenger    18.472586 12.146165 24.79901
    ## AMC Javelin         18.926866 12.605006 25.24873
    ## Camaro Z28          16.762355 10.405490 23.11922
    ## Pontiac Firebird    16.735633 10.378127 23.09314
    ## Fiat X1-9           26.943574 20.459150 33.42800
    ## Porsche 914-2       25.847957 19.412345 32.28357
    ## Lotus Europa        29.198941 22.589030 35.80885
    ## Ford Pantera L      20.343151 14.025952 26.66035
    ## Ferrari Dino        22.480940 16.143362 28.81852
    ## Maserati Bora       18.205363 11.875565 24.53516
    ## Volvo 142E          22.427495 16.090827 28.76416

## Question 6

Consider again the mtcars data set and a linear regression model with
mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as
2,000 lbs. Construct a 95% confidence interval for the expected change
in mpg per 1 short ton increase in weight. Give the lower endpoint.

``` r
fit <- lm(mpg ~ wt, data = mtcars)
confint(fit)[2, ] * 2
```

    ##     2.5 %    97.5 % 
    ## -12.97262  -8.40527

## Question 7

If my X from a linear regression is measured in centimeters and I
convert it to meters what would happen to the slope coefficient?

``` r
#It would get multiplied by 100
```

## Question 8

I have an outcome, Y, and a predictor, X and fit a linear regression
model with Y=β0+β1X+ϵ to obtain β^0 and β^1. What would be the
consequence to the subsequent slope and intercept if I were to refit the
model with a new regressor, X+c for some constant, c?

``` r
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
fit$coef
```

    ## (Intercept)           x 
    ##   0.1884572   0.7224211

``` r
x_c <- x + 10
fit_c <- lm(y ~ x_c)
fit_c$coef
```

    ## (Intercept)         x_c 
    ##  -7.0357536   0.7224211

``` r
fit$coef[1] - 10 * fit$coef[2] 
```

    ## (Intercept) 
    ##   -7.035754

``` r
#The new intercept would be β^0−cβ^1
```

## Question 9

Refer back to the mtcars data set with mpg as an outcome and weight (wt)
as the predictor. About what is the ratio of the the sum of the squared
errors when comparing a model with just an intercept (denominator) to
the model with the intercept and slope (numerator)?

``` r
fit0 <- lm(mpg ~ wt, data = mtcars)
fit1 <- lm(mpg ~ 1, data = mtcars)
1 - summary(fit0)$r.squared
```

    ## [1] 0.2471672

## Question 10

Do the residuals always have to sum to 0 in linear regression?

``` r
# If an intercept is included, then they will sum to 0
```
