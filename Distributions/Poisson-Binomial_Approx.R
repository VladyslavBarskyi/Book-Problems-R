# Set up variables  
n <- 100
lambdas <- c(4, 6, 12)
p_values <- lambdas / n
k_max <- 25 

# Set up transparent pastel colours
color_binom <- rgb(0.30, 0.71, 0.67, alpha = 0.6) 
color_pois <- rgb(1.00, 0.54, 0.40, alpha = 0.6)  

# Split the plotting screen
par(mfrow = c(1, 3))

# Create a for loop for each lambda
for (i in 1:3) {
  lambda <- lambdas[i]
  p <- p_values[i]
  k <- 0:k_max
  
  # 1. Calculate the p.m.f to find the TVD
  binom_probs <- dbinom(k, size = n, prob = p)
  pois_probs <- dpois(k, lambda = lambda)
  
  tvd <- 0.5 * sum(abs(binom_probs - pois_probs))
  y_max <- max(c(binom_probs, pois_probs))
  
  # 2. Plot Base for the Binomial
  barplot(binom_probs, 
          names.arg = k, 
          col = color_binom, 
          main = paste("Lambda =", lambda),
          sub = paste("TVD =", round(tvd, 4)),
          xlab = "k", 
          ylab = "Probability",
          ylim = c(0, y_max * 1.1),
          space = 0)
  
  # 3. Plot Overlay for the Poisson
  barplot(pois_probs, 
          col = color_pois, 
          border = NA,
          add = TRUE,
          space = 0)
  
  # Add the legend
  legend("topright",
         legend = c("Binomial", "Poisson"),
         fill = c(color_binom, color_pois),
         bty = "n")
}
