# BetaMixtureBayesianCredibleInterval

This code is similar to the Bayesian Credible interval with the Binomial Beta conjugate prior except it is a mixuture where the prior is 1/2*Beta(10,1) + 1/2*Beta(1,10). This problem is to demonstrate that when there is a mixture prior that is quite different for two different parts of the mixture, it is difficult to get coverage on the Bayesian credible interval.

When the sample size is small, the mixture 1/2 and 1/2 prior performs very poorly for the Bayesian credible interval. This is because the Bayesian method learns from the data and you need a higher sample size in order to learn well from the data. I implemented the mixture of priors in this situation in order to sample for the Bayes interval. 

When the p0 and p1 are closer together, the Bayesian credible interval has better coverage, but still not as good as the frequentest interval. If you go to the extremes of the p0 and p1, then the Bayesian has zero coverage for a small sample size. This shows that you need a larger sample and less extreme p values in order for the Bayesian interval to do better.

A mixture of two different beta's that have quite different distributions also causes the Bayesian estimate to have low coverage. This is because the prior has a mixture of two completely different distributions. Unless the p values are very close together, it is difficult to have good coverage for the Bayesian estimate
