my_double <- function(x) {
  x * 2
}
my_double(5)

triple <- function(x) {
  x * 3
}
triple(6)

cube <- function(x) {
  x ** 3
}
cube(4)

# or no need parenthesis
my_triple <- function(x) x * 3
my_triple(5)

# with default argument
power_cube <- function(x, power=3) {
  x ** power
}
power_cube(10)
power_cube(10, 4)

# Quiz
roll_dice <- function() {
  x <- sample(1:6, size = 1, replace = TRUE)
  y <- sample(1:6, size = 1, replace = TRUE)
  
  x + y
}
roll_dice()
