
```{r eval=FALSE}
p0 <- 0.20
p1 <- 0.80
Delta <- p0 - p1
n0 <- 100
n1 <- 100
a0 <- 10
a1 <- 1
b0 <- 1
b1 <- 10

mc <- 5000
cover <- coverb <- rep(0,mc)
for (iter in 1:mc){
  x0 <- rbinom(1,n0,p0)
  x1 <- rbinom(1,n1,p1) 
  test <- prop.test(c(x0,x1),c(n0,n1))
  u <- test$conf.int[2]
  l <- test$conf.int[1]
  theta0 <- 1/2*rbeta(5000,x0+a0,n0-x0 + b0) + 1/2*rbeta(5000,x0+a1,n0-x0 + b1) #p0
  theta1 <- 1/2*rbeta(5000,x1+a0,n1-x1 + b0) + 1/2*rbeta(5000,x1+a1,n1-x1 + b1) #p1
  delta.sample <- theta0 - theta1
  ubayes <- quantile(delta.sample,0.975)
  lbayes <- quantile(delta.sample,0.025)
  coverb[iter] <- Delta > lbayes & Delta < ubayes
  cover[iter] <- Delta > l & Delta < u	
}
mean(cover)
mean(coverb)