#QUESTION: 01

#p=0.1, 0.3, 0.5, 0.8
# n=10
v11=rbinom(1000, 10 ,0.1)
v12=rbinom(1000, 10 ,0.3)
v13=rbinom(1000, 10 ,0.5)
v14=rbinom(1000, 10 ,0.8)

#p=0.1, 0.3, 0.5, 0.8
# n=30
v21=rbinom(1000, 30 ,0.1)
v22=rbinom(1000, 30 ,0.3)
v23=rbinom(1000, 30 ,0.5)
v24=rbinom(1000, 30 ,0.8)

#p=0.1, 0.3, 0.5, 0.8
# n=50
v31=rbinom(1000, 50 ,0.1)
v32=rbinom(1000, 50 ,0.3)
v33=rbinom(1000, 50 ,0.5)
v34=rbinom(1000, 50 ,0.8)

#p=0.1, 0.3, 0.5, 0.8
# n=100
v41=rbinom(1000, 100 ,0.1)
v42=rbinom(1000, 100 ,0.3)
v43=rbinom(1000, 100 ,0.5)
v44=rbinom(1000, 100 ,0.8)


sim = data.frame(v11, v12, v13, v14, v21, v22, v23, v24, v31, v32, v33, v34, v41, v42, v43, v44)

# What is the impact of increase in sample size? 
# Then the sample size is increased the mean will also be increased.

# What is the effect of p on the results?
# The effect of p on the result is that, the greater the probability the greater will be the result

#_______________________________________________________________________________

#QUESTION: 02

#simulated mean and variance
sim_mean = mean(v33)
print(sim_mean)
sim_var = var(v33)
print(sim_var)

#theoretical mean and variance
theo_mean = np = 50*0.5
print(theo_mean)
theo_var= npq = 50*0.5*0.5
print(theo_var)

mean_diff = (theo_mean)-(sim_mean) 
print(mean_diff)
var_diff = (theo_var)-(sim_var) 
print(var_diff)

# yes ! there is a little bit difference in the results of empirical mean and actual mean.
#_______________________________________________________________________________

#QUESTION: 03

s1=rbinom(1000, 30 ,0.1)
hist(s1,breaks = 30,main = "")
s2=rbinom(1000, 30 ,0.5)
hist(s2,breaks = 30,main = "")
s3=rbinom(1000, 30 ,0.9)
hist(s3,breaks = 30,main = "")


#_______________________________________________________________________________

#QUESTION: 04

y1 = rpois(1000, 5)
summary(y1)
y2 = rpois(1000, 10)
summary(y2)
y3 = rpois(1000, 15)
summary(y3)
y4 = rpois(1000, 25)
summary(y4)
y5 = rpois(1000, 30)
summary(y5)
y6 = rpois(1000, 50)
summary(y6)

#As increase with the value of parameter which is lambda the overall value and the mean is increasing too.
#_______________________________________________________________________________

#QUESTION: 05

#simulated mean and variance
sim_mean_pois = mean(y3)
print(sim_mean_pois)
sim_var_pois = var(y3)
print(sim_var_pois)

#theoretical mean and variance
theo_mean_pois = np = 15
print(theo_mean_pois)
theo_var_pois= npq = 15
print(theo_var_pois)

mean_diff_pois = (theo_mean_pois)-(sim_mean_pois) 
print(mean_diff_pois)
var_diff_pois = (theo_var_pois)-(sim_var_pois) 
print(var_diff_pois)

# yes ! there is a little bit difference in the results of empirical mean and actual mean.

#_______________________________________________________________________________


#QUESTION: 06

g1 = rpois(1000, 10)
hist(g1,                                      
     breaks = 100,
     main = "")
g2 = rpois(1000, 20)
hist(g2,                                      
     breaks = 100,
     main = "")
g3 = rpois(1000, 30)
hist(g3,                                     
     breaks = 100,
     main = "")

#  From the above plot we concluded, as the Mean(lambda) value increases the spread of the graph increases.