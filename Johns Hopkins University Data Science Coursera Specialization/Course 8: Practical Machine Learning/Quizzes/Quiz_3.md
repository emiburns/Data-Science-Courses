Course 8: Quiz 3
================

## Question 1

For this quiz we will be using several R packages. R package versions
change over time, the right answers have been checked using the
following versions of the packages.

AppliedPredictiveModeling: v1.1.6

caret: v6.0.47

ElemStatLearn: v2012.04-0

pgmm: v1.1

rpart: v4.1.8

If you aren’t using these versions of the packages, your answers may not
exactly match the right answer, but hopefully should be close.

Load the cell segmentation data from the AppliedPredictiveModeling
package using the commands:

``` r
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
```

    ## Loading required package: lattice

    ## Loading required package: ggplot2

1.  Subset the data to a training set and testing set based on the Case
    variable in the data set.

<!-- end list -->

``` r
inTrain<-createDataPartition(y=segmentationOriginal$Case,p=0.7,list=FALSE)
training<-segmentationOriginal[inTrain,]
testing<-segmentationOriginal[-inTrain,]
```

2.  Set the seed to 125 and fit a CART model with the rpart method using
    all predictor variables and default caret settings.

<!-- end list -->

``` r
set.seed(125)
mod <- train(Class~.,method="rpart", data=training, tuneLength=10)
```

3.  In the final model what would be the final model prediction for
    cases with the following variable values:

<!-- end list -->

1.  TotalIntench2 = 23,000; FiberWidthCh1 = 10; PerimStatusCh1=2

2.  TotalIntench2 = 50,000; FiberWidthCh1 = 10;VarIntenCh4 = 100

3.  TotalIntench2 = 57,000; FiberWidthCh1 = 8;VarIntenCh4 = 100

4.  FiberWidthCh1 = 8;VarIntenCh4 = 100; PerimStatusCh1=2

<!-- end list -->

``` r
library(rattle)
```

    ## Loading required package: tibble

    ## Loading required package: bitops

    ## Rattle: A free graphical interface for data science with R.
    ## Version 5.4.0 Copyright (c) 2006-2020 Togaware Pty Ltd.
    ## Type 'rattle()' to shake, rattle, and roll your data.

``` r
fancyRpartPlot(mod$finalModel)
```

![](Quiz_3_files/figure-gfm/3-1.png)<!-- -->

``` r
#Answer: a. PS, b. Not possible to predict, c. PS, d. Not possible to predict
```

## Question 2

If K is small in a K-fold cross validation is the bias in the estimate
of out-of-sample (test set) accuracy smaller or bigger? If K is small is
the variance in the estimate of out-of-sample (test set) accuracy
smaller or bigger. Is K large or small in leave one out cross
validation?

``` r
# The bias is larger and the variance is smaller. Under leave one out cross validation K is equal to the sample size.
```

## Question 3

Load the olive oil data using the commands:

``` r
library(pgmm)
data(olive)
olive = olive[,-1]
```

(NOTE: If you have trouble installing the pgmm package, you can download
the -code-olive-/code- dataset here: olive\_data.zip. After unzipping
the archive, you can load the file using the -code-load()-/code-
function in R.)

These data contain information on 572 different Italian olive oils from
multiple regions in Italy. Fit a classification tree where Area is the
outcome variable. Then predict the value of area for the following data
frame using the tree command with all defaults

``` r
newdata = as.data.frame(t(colMeans(olive)))
```

What is the resulting prediction? Is the resulting prediction strange?
Why or why not?

``` r
#2.783. It is strange because Area should be a qualitative variable- but tree is reporting the average value of Area as a numeric variable in the leaf predicted for newdata
```

## Question 4

Load the South Africa Heart Disease Data and create training and test
sets with the following code:

``` r
library(readr)
SAheart <- readr::read_csv("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/SAheart.data")
```

    ## Parsed with column specification:
    ## cols(
    ##   row.names = col_double(),
    ##   sbp = col_double(),
    ##   tobacco = col_double(),
    ##   ldl = col_double(),
    ##   adiposity = col_double(),
    ##   famhist = col_character(),
    ##   typea = col_double(),
    ##   obesity = col_double(),
    ##   alcohol = col_double(),
    ##   age = col_double(),
    ##   chd = col_double()
    ## )

``` r
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
```

Then set the seed to 13234 and fit a logistic regression model
(method=“glm”, be sure to specify family=“binomial”) with Coronary
Heart Disease (chd) as the outcome and age at onset, current alcohol
consumption, obesity levels, cumulative tobacco, type-A behavior, and
low density lipoprotein cholesterol as predictors. Calculate the
misclassification rate for your model using this function and a
prediction on the “response” scale:

``` r
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
```

What is the misclassification rate on the training set? What is the
misclassification rate on the test set?

``` r
set.seed(13234)

mod <- train(chd~age+alcohol+obesity+tobacco+typea+ldl,data=trainSA,method="glm",family="binomial")
```

    ## Warning in train.default(x, y, weights = w, ...): You are trying to do
    ## regression and your outcome only has two possible values Are you trying to do
    ## classification? If so, use a 2 level factor as your outcome column.

``` r
pred<-predict(mod,testSA)
pred2<-predict(mod,trainSA)

missClass(testSA$chd,pred)
```

    ## [1] 0.2813853

``` r
missClass(trainSA$chd,pred2)
```

    ## [1] 0.3116883

``` r
#Test Set Misclassification: .31, Training Set: .27
```

## Question 5

Load the vowel.train and vowel.test data sets:

``` r
vowel.train <- readr::read_csv("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/vowel.test")
```

    ## Parsed with column specification:
    ## cols(
    ##   row.names = col_double(),
    ##   y = col_double(),
    ##   x.1 = col_double(),
    ##   x.2 = col_double(),
    ##   x.3 = col_double(),
    ##   x.4 = col_double(),
    ##   x.5 = col_double(),
    ##   x.6 = col_double(),
    ##   x.7 = col_double(),
    ##   x.8 = col_double(),
    ##   x.9 = col_double(),
    ##   x.10 = col_double()
    ## )

``` r
vowel.test <- readr::read_csv("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/vowel.train")
```

    ## Parsed with column specification:
    ## cols(
    ##   row.names = col_double(),
    ##   y = col_double(),
    ##   x.1 = col_double(),
    ##   x.2 = col_double(),
    ##   x.3 = col_double(),
    ##   x.4 = col_double(),
    ##   x.5 = col_double(),
    ##   x.6 = col_double(),
    ##   x.7 = col_double(),
    ##   x.8 = col_double(),
    ##   x.9 = col_double(),
    ##   x.10 = col_double()
    ## )

Set the variable y to be a factor variable in both the training and test
set. Then set the seed to 33833. Fit a random forest predictor relating
the factor variable y to the remaining variables. Read about variable
importance in random forests here:
<http://www.stat.berkeley.edu/~breiman/RandomForests/cc_home.htm#ooberr>
The caret package uses by default the Gini importance.

Calculate the variable importance using the varImp function in the caret
package. What is the order of variable importance?

\[NOTE: Use randomForest() specifically, not caret, as there’s been some
issues reported with that approach. 11/6/2016\]

``` r
#training and test set
library(randomForest)
```

    ## randomForest 4.6-14

    ## Type rfNews() to see new features/changes/bug fixes.

    ## 
    ## Attaching package: 'randomForest'

    ## The following object is masked from 'package:rattle':
    ## 
    ##     importance

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     margin

``` r
vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)

set.seed(33833)

#rf fitting
mod.rf <- randomForest(y~.,data=vowel.train,importance=TRUE)
importance(mod.rf)
```

    ##                   1         2        3         4        5         6         7
    ## row.names  8.765854  9.889591 12.75787  9.612472 10.75558  9.598947  9.522224
    ## x.1       21.443214 26.601373 35.67731 41.406763 38.79646 37.860395 37.771724
    ## x.2       42.654471 31.375950 36.62208 29.809063 31.97561 30.637803 33.164623
    ## x.3       18.652379 16.735218 15.49708 16.539240 18.02815 14.312135 16.768495
    ## x.4       30.499084 35.779722 30.80900 25.535033 23.08636 25.774238 26.755381
    ## x.5       19.261002 25.752108 21.86240 20.666994 25.41382 17.824958 18.870211
    ## x.6       16.921653 21.806049 20.99823 24.098480 20.81214 16.857898 14.214508
    ## x.7       14.206829 10.484044 15.14423 12.303684 13.09626 14.754549 22.685497
    ## x.8        9.747732 14.280392 13.82227 14.283583 15.49160 15.251381 15.570594
    ## x.9       11.337820 12.817387 15.48300 19.301793 16.73605 16.032326 18.473096
    ## x.10      10.763474 12.689107 12.87780  9.643071 15.49636 14.243168 14.052701
    ##                  8         9       10        11 MeanDecreaseAccuracy
    ## row.names 11.41619  8.009709 10.40509  9.182811             25.82734
    ## x.1       38.38098 49.579477 57.15444 40.021612             72.14022
    ## x.2       39.30650 12.318930 19.97109 26.907211             59.74065
    ## x.3       12.81829 10.892635 15.70783 19.883586             36.68031
    ## x.4       28.10987 19.811337 24.10992 28.786168             50.94882
    ## x.5       22.27757 12.183628 17.65527 17.889856             35.81217
    ## x.6       10.03950  9.433811 14.00223 16.968634             33.24817
    ## x.7       20.37268 10.209556 17.84425 14.668582             34.84575
    ## x.8       14.15803  8.240139 10.40992 14.671564             29.58979
    ## x.9       11.28544  6.170090 13.38407 14.089237             30.22946
    ## x.10      13.73196 11.222904 15.44850  9.977217             33.20930
    ##           MeanDecreaseGini
    ## row.names         14.91990
    ## x.1               85.44805
    ## x.2               75.40170
    ## x.3               28.22924
    ## x.4               50.17422
    ## x.5               35.43971
    ## x.6               29.74831
    ## x.7               29.26927
    ## x.8               22.57100
    ## x.9               26.44923
    ## x.10              21.43055

``` r
varImpPlot(mod.rf)
```

![](Quiz_3_files/figure-gfm/q5-1.png)<!-- -->

``` r
#The order of the variable is: x.2, x.1, x.6, x.8, x.4, x.9, x.3, x.7, x.10
```
