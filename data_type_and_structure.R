X <- 1:10
y <- 5
X
y
X * y
Z <- seq(1, 100, by=0.5)
W = Z * y
Z
R <- matrix(1:25, nrow = 5, ncol = 5)
R
class(R)
R[1,]
R[,1]
R <- matrix(1:25, ncol = 5)
R
R * 5
arsenal <- c("Mesut", "Hector", "Auba", "Laca")
arsenal
class(arsenal)
ages <- c(30, 24, 29, 27)
gender <- c(T,T,T,F)
length(arsenal)
data.frame(arsenal, ages, gender) ## create data frame
df <- data.frame(arsenal, ages, gender)
df
my_list <- list(df, R, arsenal)
my_list
class(my_list)
