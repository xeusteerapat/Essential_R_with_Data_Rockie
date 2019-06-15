mtcars
help("mtcars")
mtcars[,1]
head(mtcars) # print first 6 rows
head(mtcars, 3) # print first 3 rows
tail(mtcars) # print last 6 rows
str(mtcars) # structure of data
summary(mtcars) # summary data overall (such as mean, median)
mt_first_6 <- head(mtcars)
mt_first_6
mt_first_6[1:3, ] # select row 1 -3 for every column
mt_first_6[, 1:2] # select column 1 -2 every rows
mt_first_6[1:3, 1:4]
mt_first_6[1:3, 'am'] # select rows 1 - 3 column "am"
mt_first_6[1:3, c("hp", "wt", "mpg")] # select by column name

# finding stats in data frame
head(mtcars, 3)
mtcars$mpg # select element from column mpg
mean(mtcars$mpg)
median(mtcars$mpg)
sd(mtcars$mpg)
sum(mtcars$mpg)
sd(mtcars$mpg) ** 2 # variance
var(mtcars$mpg)
min(mtcars$hp)
max(mtcars$mpg)
cor(mtcars$mpg, mtcars$hp) #relation between mpg and hp
cor(mtcars) # correlation matrix
cor(mtcars[, 1:5])
rsult <- cor(mtcars[, 1:5])
write.csv(rsult, "cor_matrix.csv") # export to csv data
write.csv(mtcars, "mtcar.csv")
list.files()
mt_csv <- read.csv("mtcar.csv")
mt_csv
