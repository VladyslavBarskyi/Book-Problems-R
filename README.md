# Statistical Explorations in R

Technical write-ups at the intersection of probability theory and computational statistics — built in R, with an emphasis on first-principles reasoning and empirical verification.

---

## Probability & Statistics

### Distributions

**[Convergence rate of the Poisson approximation to the Binomial](https://rpubs.com/VladyslavBarskyi/poisson-binomial-approx)**
Quantifies how quickly Bin(n, p) converges to Pois(λ) using Total Variation Distance as the error metric. Derives and visualises the structural variance gap — Var(X_Bin) < Var(X_Pois) — and explores what it implies about when the approximation is safe to use.
`R Markdown` `TVD` `MGF`

---

**[Empirical verification of the memoryless property](https://rpubs.com/VladyslavBarskyi/poisson-binomial-approx)**
Uses large-scale Monte Carlo trials to confirm that P(Y > a + b | Y > a) = P(Y > b) holds numerically for the Geometric distribution. Bridges the gap between the algebraic proof and simulation-based evidence.
`R Markdown` `Monte Carlo` `Geometric`
