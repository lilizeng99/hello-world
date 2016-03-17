install.packages("statnet")
library("statnet")

# Simulate a simple G(n,p) model
# Step 1. Create the netowrk, with the probability of having an edge
# to be 0.05 (fixed at first)
g.np <- rgraph(n = 100, m = 1, tprob = 0.05)
g.np <- as.network(g.np)
summary(g.np)
plot(g.np, displayisolates = FALSE, vertex.cex = 0.5)

# Step 2. Choose a random node to start the diffusion process
