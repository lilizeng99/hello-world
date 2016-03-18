#install.packages("statnet")
library("statnet")
set.seed(567)
x <- rnorm(n = 1, m=10, sd=4) 
mean(x)

# Simulate a simple G(n,p) model
# Step 1. Create the netowrk, with the probability of having an edge
# to be 0.05 (fixed at first)
num_node = 30
g.np <- rgraph(n = num_node, m = 1, tprob = 0.3)
g.np <- as.network(g.np)
summary(g.np)
plot(g.np, displayisolates = TRUE, vertex.cex = 0.5)

# Step 2. Choose a random node to start the diffusion process
initial_seed <- sample(1:num_node, 1)
check_list <- initial_seed
# add initial_seed to the checklist

# While check_list is not null, do the loop:
followers <- get.neighborhood(g.np, initial_seed, type = "in")
p_retweet <- 0.3
followers
set.vertex.attribute(g.np, "wt", value = -1)
get.vertex.attribute(g.np, "wt")

for (i in followers){
  retweeted <- runif(1, 0.0, 1.0)
  if (retweeted <= p_retweet){
    time <- rnorm(n = 1, m=10, sd=4)
    set.vertex.attribute(g.np, "wt", value = time, v = i)
    # check_list <- c(check_list, i)
    # add i into the checklist
  }
}

