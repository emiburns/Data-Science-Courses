Quiz 4
================

## Question 1

A pharmaceutical company is interested in testing a potential blood
pressure lowering medication. Their first examination considers only
subjects that received the medication at baseline then two weeks later.
The data are as follows (SBP in mmHg)

    ##   Subject Baseline Week2
    ## 1       1      140   132
    ## 2       2      138   135
    ## 3       3      150   151
    ## 4       4      148   146
    ## 5       5      135   130

Consider testing the hypothesis that there was a mean reduction in blood
pressure? Give the P-value for the associated two sided T test.

(Hint, consider that the observations are paired.)

  - 0.05
  - 0.087
  - 0.043
  - 0.10

<!-- end list -->

``` r
test <- t.test(x = table$Baseline, y = table$Week2, alt = "two.sided", paired = TRUE)
pval <- test$p.value
round(pval,3)
```

    ## [1] 0.087

## Question 2

A sample of 9 men yielded a sample average brain volume of 1,100cc and a
standard deviation of 30cc. What is the complete set of values of μ0
that a test of H\_0: μ=μ0 would fail to reject the null hypothesis in a
two sided 5% Students t-test?

  - 1081 to 1119
  - 1080 to 1120
  - 1031 to 1169
  - 1077 to 1123

<!-- end list -->

``` r
n <- 9
mu <- 1100
sigma <- 30
quantile = 0.975 

mu + c(-1, 1) * qt(quantile, df=n-1) * sigma / sqrt(n)
```

    ## [1] 1076.94 1123.06

## Question 3

Researchers conducted a blind taste test of Coke versus Pepsi. Each of
four people was asked which of two blinded drinks given in random order
that they preferred. The data was such that 3 of the 4 people chose
Coke. Assuming that this sample is representative, report a P-value for
a test of the hypothesis that Coke is preferred to Pepsi using a one
sided exact test.

  - .1
  - .62
  - .005
  - .31

<!-- end list -->

``` r
# p = proportion of people who prefer Coke -->
# H0: p=.5, Ha: p>.5

pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE)
```

    ## [1] 0.3125

``` r
#OR

choose(4, 3) * 0.5^4 + choose(4, 4) * 0.5^4
```

    ## [1] 0.3125

## Question 4

Infection rates at a hospital above 1 infection per 100 person days at
risk are believed to be too high and are used as a benchmark. A hospital
that had previously been above the benchmark recently had 10 infections
over the last 1,787 person days at risk. About what is the one sided
P-value for the relevant test of whether the hospital is *below* the
standard?

  - .03
  - .22
  - .52
  - .11

<!-- end list -->

``` r
ppois(10, lambda = 0.01 * 1787)
```

    ## [1] 0.03237153

## Question 5

Suppose that 18 obese subjects were randomized, 9 each, to a new diet
pill and a placebo. Subjects’ body mass indices (BMIs) were measured at
a baseline and again after having received the treatment or placebo for
four weeks. The average difference from follow-up to the baseline
(followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for
the placebo group. The corresponding standard deviations of the
differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the
placebo group. Does the change in BMI appear to differ between the
treated and placebo groups? Assuming normality of the underlying data
and a common population variance, give a pvalue for a two sided t test.

  - Larger than 0.10
  - Less than 0.10 but larger than 0.05
  - Less than 0.01
  - Less than 0.05, but larger than 0.01

<!-- end list -->

``` r
n_y <- 9 
n_x <- 9 
σ_y <- 1.5
σ_x <- 1.8 
μ_y <- -3
μ_x <- 1

#pooled std
σ_p <- (((n_x - 1) * σ_x^2 + (n_y - 1) * σ_y^2)/(n_x + n_y - 2))
pval <- pt((μ_y - μ_x) / (σ_p * (1 / n_x + 1 / n_y)^.5), df=n_y + n_x -2)

round(pval, 4)
```

    ## [1] 0.0035

## Question 6

Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to
1,123 cc. Would you reject in a two sided 5% hypothesis test of
H0:μ=1,078?

  - It’s impossible to tell
  - Yes you would reject
  - Where does Brian come up with these questions?
  - No you wouldn’t reject

<!-- end list -->

``` r
# No you wouldn't reject. The 95% interval would be wider than the 90% interval. Since 1,078 is in the narrower 90% interval, it would also be in the wider 95% interval. Thus, in either case it's in the interval and so you would fail to reject.
```

## Question 7

Researchers would like to conduct a study of 100 healthy adults to
detect a four year mean brain volume loss of .01 mm3. Assume that the
standard deviation of four year volume loss in this population is .04
mm3. About what would be the power of the study for a 5% one sided test
versus a null hypothesis of no volume loss?

  - .7-
  - .80
  - .50
  - .60

<!-- end list -->

``` r
pnorm(1.645 * 0.004, mean = 0.01, sd = 0.004, lower.tail = FALSE)
```

    ## [1] 0.8037244

## Question 8

Researchers would like to conduct a study of n healthy adults to detect
a four year mean brain volume loss of .01 mm3. Assume that the standard
deviation of four year volume loss in this population is .04 mm3. About
what would be the value of n needed for 90% power of type one error rate
of 5% one sided test versus a null hypothesis of no volume loss?

  - 180
  - 160
  - 140
  - 120

<!-- end list -->

``` r
ceiling((4 * (qnorm(0.95) - qnorm(0.1)))^2)
```

    ## [1] 138

``` r
#OR

μ <- 0.01
σ <- 0.04
p <- 0.05 
pow <- 0.9 
n <- power.t.test(power=pow, delta=μ, sd=σ, sig.level=p, type="one.sample", alt="one.sided")$n
ceiling(n/10)*10
```

    ## [1] 140

## Question 9

As you increase the type one error rate, α, what happens to power?

  - You will get larger power.
  - No, for real, where does Brian come up with these problems?
  - You will get smaller power.
  - It’s impossible to tell given the information in the problem.

<!-- end list -->

``` r
# As you require less evidence to reject, i.e. your α rate goes up and you will have larger power
```
