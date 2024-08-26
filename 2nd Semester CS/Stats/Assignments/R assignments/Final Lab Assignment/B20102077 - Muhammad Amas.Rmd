---
title: "BSCS_306_Practical"
author: "Muhammad Amas"
output: word_document
---

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this

## Input data into R

```{r}
library(datasets)
###Following Data Set is about the weight of Chickens on different diets.

#if you wanna see data set so remove '#' from the bottom line
#data(ChickWeight)
View(ChickWeight)

#Showing upper few values of Data Set
head(ChickWeight)

#Showing Last few values of Data Set
tail(ChickWeight) 

```

## Data Summaries/ Description

```{r}
#Will show the names of the columns
names(ChickWeight)

# Dimension of data set.
dim(ChickWeight)

# Giving a summarized view of data set.
summary(ChickWeight)

# Describing one quantitative variable.
library(psych)
describe(ChickWeight)

```

## Data Plots/ Visualization

```{r}
plot(ChickWeight$weight, ChickWeight$Diet, col="#940034")
#it shows Scattered Plot of Chick weight with Chick diet

boxplot(ChickWeight$weight ~ ChickWeight$Diet, main="Weight Box Plot According to Different Diets", col = "thistle1")
#Plot shows that chicks are gaining weight on Diet number 3

##Histograms of Chick Weights according to their Diets.
hist(ChickWeight$weight [ChickWeight$Diet =="1"],
     col    = "#ffd966", 
     xlim   = c(0,200),
     breaks = 15,
     main   = "Histogram: Weight on Diet 1",
     xlab   = "Weight (in kg)")
hist(ChickWeight$weight [ChickWeight$Diet =="2"],
     col    = "#ffd966", 
     xlim   = c(0,200),
     breaks = 15,
     main   = "Histogram: Weight on Diet 2",
     xlab   = "Weight (in kg)")
hist(ChickWeight$weight [ChickWeight$Diet =="3"],
     col    = "#ffd966", 
     xlim   = c(0,200),
     breaks = 15,
     main   = "Histogram: Weight on Diet 3",
     xlab   = "Weight (in kg)")
hist(ChickWeight$weight [ChickWeight$Diet =="2"],
     col    = "#ffd966", 
     xlim   = c(0,200),
     breaks = 15,
     main   = "Histogram: Weight on Diet 4",
     xlab   = "Weight (in kg)")

Weight_of_chicks <- table(ChickWeight$weight)

#Bar plot of Chick Weights
barplot(Weight_of_chicks,
        main = "Bar chart: of chick weights",
        col = "#134f5c",
        xlab = "Weights",
        ylab = "Frequency")

#Line Charts of Chick Weights
plot(Weight_of_chicks,
     main = "Line chart: of chick weights",
     col = "#134f5c",
     xlab = "Weights",
     ylab = "Frequency")

```


## Correlation

```{r}
library(corrplot)

  cor(ChickWeight[, unlist(lapply(ChickWeight, is.numeric))])
  cor.mat.ChickWeight = cor(ChickWeight[, unlist(lapply(ChickWeight, is.numeric))])
corrplot(cor.mat.ChickWeight)

#From the plots we have concluded that the correlation is strong Positive.

```

## Confidence Interval

```{r}
library(Rmisc)

CI(ChickWeight$weight, ci = 0.95)
#Hence mean is lying in the confidence interval so we will accept the Null hypothesis.

CI(ChickWeight$Time, ci = 0.95)
#Hence mean is lying in the confidence interval so we will accept the Null hypothesis.

```

## Hypothesis Testing

```{r}
library(stats)

#one sample t test
#Question: Is the mean value of Weights from 121.8 or not?
t.test(ChickWeight$weight, mu=121.8)
#answer:First this is two tail test after this the mean value of weights differs from 121.8,and p value is more than 0.05 so null hypothesis is accepted

#Is the mean value of Murder differ from 10.72 or not?
t.test(ChickWeight$Time, mu=10.72)
#answer:Two tail test after this the mean value of time differs from 10.72,and p value is more than 0.05 so null hypothesis is accepted

#Two Sample Test
x <- rnorm(ChickWeight$weight)
y <- rnorm(ChickWeight$Diet)
t.test(x,y, var.equal = TRUE)
#True difference in means is not equal to 0

```

## Chi Square Test

```{r}

#apply the Chi-Square test to see test of association/ independence.
chisq.test(ChickWeight$weight, ChickWeight$Diet)

#we have x-squared = 631.55,Since we get a p-Value greater than the significance level of 0.05, we accept the null hypothesis and conclude that the two variables are in fact independent.

```

## Analysis of Variance

```{r}

#Question: Does the diet effect on weights?

boxplot(ChickWeight$weight ~ ChickWeight$Diet, col= "#ffc9c9")
model1 <- aov(ChickWeight$weight ~ ChickWeight$Diet)
summary(model1)
#it is observed that the F-statistic value is 10.81 and it is  significant as the corresponding p-value is  smaller. Thus, it is wise to reject the null hypothesis of diets. In other words, the weights in diets does affect.

library(gplots)
plotmeans(ChickWeight$weight ~ ChickWeight$Diet, main="Mean Plot with 95% Confidence Interval", ylab = "Diet", xlab = "Weight", col = "#ffa09f")


```

## Linear and Multiple Regression Models

```{r}

###Linear Regression line formula:

# This will give details of the model including the 
# correlation, parameters (intercept and slope) along with P-value and Mean sum of squares.

attach(ChickWeight)

fit.LR <- lm(weight~ Diet, data = ChickWeight)
summary(fit.LR)  

#ANSWER:firstly,P value is less than 0.05 which mean intercept is significant while in Diets we see that p value is less than 0.05 so it will be accepted so in other word we can say that Diet has much significance impact on the Weight. Secondly, signs are positive which shows if one increases other greatly increases as well ,In Multiple R-squared is 0.04853 so for correlation we do square root of it so answer is 0.2202 which is positive so there is some corelation with Weight and Diet.

###PLOTS:
scatter.smooth(x=Diet, y = weight, main="weight ~ Diet")

library(ggplot2)
ggplot(ChickWeight,aes(y=Time,x=weight))+geom_point()+geom_smooth(method="lm")

#plots show us:
#1)Linearity

#The relationship between the independent and dependent variable must be linear. We can test this visually with a scatter plot to see if the distribution of data points could be described with a straight line.

#2)Independence of observations

#Because we only have one independent variable and one dependent variable from the given data result so, we don’t need to test for any hidden relationships among variables.

#3)Normality

#using the hist function we find from the above data the whether dependent variable follows normal distribution

###Multiple Regression line formula:
#---------------------------------

fit.MR <- lm(weight~ + Time + Diet  , data = ChickWeight)
summary(fit.MR)
#answer:P value is very low in intercept and in murder it has +ve sign so positive correlation exists in it and taking sq.rt of Multiple R-squared: 0.7453 we get 0.694.

# beta0 = intercept of the regression line. which is 27.8983
# beta1 = slope of the time is 8.7152
# beta1 = slope of the Diet 2 is 16.1661
# beta1 = slope of the Diet 3 is 36.4994
# beta2 = slope of the Diet 4 is 30.2335

library(dplyr)
library(ggplot2)

ChickWeight %>%
  filter(weight < 373)%>%
  ggplot(aes(x=weight, y=Diet , col = weight))+ geom_point(alpha = 1)+
  geom_smooth(method = lm)

ChickWeight %>%
  filter(weight < 373)%>%
  ggplot(aes(x=weight, y=Time , col = weight))+ geom_point(alpha = 1)+
  geom_smooth(method = lm)

# Q:Is the overall regression model suitable?
# ---------------------------------------
anova(fit.LR)  # Test difference in slopes (joint F-test)
# The F-statistic value will tell whether the result is good or not.

#answer: the f statistic value is 10.81 and P value is less than 0.05 so we can say that  by judging by f value result is good.
```

## T-test formula for Intercept and Slope

