# Set up variables
prob_success <- 0.2
cutoff <- 5
total_simulations <- 50000

# 1. Baseline: Standard geometric simulation
baseline <- rgeom(total_simulations, prob = prob_success) + 1

# 2. Conditional: Generate a large pool, then keep only the ones greater than our cutoff
large_pool <- rgeom(total_simulations * 5, prob = prob_success) + 1
survived <- large_pool[large_pool > cutoff]

# Take the first 50,000 that survived, and subtract the cutoff
extra_hidden_trials <- survived[1:total_simulations] - cutoff

# Split the plotting screen
par(mfrow =c(1,2))

# Plot 1: The Baseline 
hist(baseline,
     breaks = 30,
     main = "Standard Distribution",
     xlab = "Trials until success",
     col = "green")

# Plot 2: The Extra Trials
hist(extra_hidden_trials,
     breaks = 30,
     main = "After Already Failing 5 Times",
     xlab = "Extra trials until success",
     col = "red")