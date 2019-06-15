# index and subset (selection)
(x <- c(100, 200, 20, 99, 480))
x[1]
x[4]
x[1:3]
x[c(1,3,5)] # select index 1, 3, 5
x > 100
x[x > 100] # subset by logical
sum(x)
mean(x)
mean(x > 100) # element more than 100 around 40%

