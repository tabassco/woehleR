# woehleR

A R package with useful calculations for endurance-strength of ferrous materials. Developed based on a course at TU Darmstadt.

## Calculations

### Rainflow Matrix

**Rainflow Matrix:** Denotes the stress cycles with the from and to categories. Counting each cycle with the [i,j] position.
To get the individual connections the 4-point algorithm is used.

---

*Inputs:*
- stress values: 2 coloumn data-frame with order-id / time-stamp and stress values
- n - Amount of categories to be used

*Returns:*
- n x n Matrix 

---
**Usage:**:

``` r
reduced_test_data <- rainflow(time_series, n = 16)
```

## Plots

### Rainflow Plot (2D - Tile)

A 2D tile plot, based on the *rainflow matrix*, showing the distribution of the external stress. 

### Woehler Curve (S-N-Curve)

Standard Woehler curve.
