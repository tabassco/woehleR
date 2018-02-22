# woehleR

A R package with useful calculations for endurance-strength of ferrous materials. Developed based on a course at TU Darmstadt.

## Calculations

### Rainflow Matrix
*Inputs:*
- stress values: 2 coloumn data-frame with order-id / time-stamp and stress values
- n - Amount of categories to be used
*Returns:*
- n x n Matrix 

**Rainflow Counting:** Use the 4-point algorithm to determine the individual stress cycles. 

**Rainflow Matrix:** Denotes the stress cycles with the from and to categories. Counting each cycle with the [i,j] position.

## Plots

### Rainflow Plot (2D - Tile)

A 2D tile plot, based on the *rainflow matrix*, showing the distribution of the external stress. 

### Woehler Curve

Standard Woehler curve.
