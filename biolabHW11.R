# Q1

bin <- function(n, p)
{
  return(sum(ifelse(runif(n, min = 0, max = 1) <= p, yes = 1, no = 0)))
}
bin(10, 0.3)

# Q2

library(microbenchmark)
microbenchmark(bin(5, 0.3), rbinom(1, 5, 0.3), times = 10000L)
# bin() used 6.494 times of minutes as rbinom().

# Q3

set.seed(123)
n <- seq(1, 50)
e <- rnorm(50, 0, 3)
x <- runif(50, 20, 40)
y <- 15 + 0.4 * x + e
lm(y ~ x)

library(ggplot2)

point <- data.frame(x, y)
ggplot(data = point, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

# Q4

set.seed(123)
u1 <- runif(100, 0, 1)
u2 <- runif(100, 0, 1)
r <- sqrt(-2 * log(u1))
theta <- 2 * pi * u2
x <- r * cos(theta)
y <- r * sin(theta)
point <- data.frame(x, y)
y2 <- rnorm(x)
point2 <- data.frame(x, y2)
ggplot() +
  geom_histogram(data = point, aes(x = x), bins = 30) +
  geom_histogram(data = point2, aes(x = x), bins = 30, fill = 2)
