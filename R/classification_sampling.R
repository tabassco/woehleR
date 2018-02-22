# Necessary Sampling Techniques for classification

# General Functions that will be reused
identify_extrema <- function(time_series_local) {
    time_series_local <- as.zoo(time_series_local)

    # minima
    mins <-
        rollapply(time_series_local[, 2], 3, function(x)
            which.min(x) == 2)
    # maxima
    maxs <-
        rollapply(time_series_local[, 2], 3, function(x)
            which.max(x) == 2)

    extrema <- mins | maxs

    extrema <- c(TRUE, extrema, TRUE)
    #return DF with time and return points
    time_series_reduced <- as.data.frame(time_series_local[extrema])

}

# 2D Sampling: Rainflow analysis

rainflow <- function(time_series, n = 16) {
    # if amount of classes not specified, display warning that default has been used

    extremas <- identify_extrema(time_series)
    extremas[, 3] <- classify(extremas[, 2], "lin", breaks = n)$index

    breaks <- classify(extremas[, 2], "lin", breaks = n)$bb
    names(extremas) <- c("time-step", "value", "category")

    # rainflow matrix from (coloumns) -> to (rows)
    rainflow <- matrix(0, n, n)

    # while loop for counting
    counter = 1
    while (counter <= nrow(extremas)-3) {
        if (((extremas[counter + 1, 3] > extremas[counter, 3] &&
            extremas[counter + 2, 3] > extremas[counter, 3] &&
            extremas[counter + 1, 3] < extremas[counter + 3, 3] &&
            extremas[counter + 2, 3] < extremas[counter + 3, 3]) | (
            extremas[counter + 1, 3] < extremas[counter, 3] &&
            extremas[counter + 2, 3] < extremas[counter, 3] &&
            extremas[counter + 1, 3] > extremas[counter + 3, 3] &&
            extremas[counter + 2, 3] > extremas[counter + 3, 3])) &&
            extremas[counter + 1, 3] != extremas[counter + 2, 3]) {
            rainflow[extremas[counter + 1, 3], extremas[counter + 2, 3]] = rainflow[extremas[counter + 1, 3], extremas[counter + 2, 3]] + 1
            extremas <- extremas[-c(counter + 1, counter + 2),]
            counter = 1
        } else {
            counter = counter + 1
        }

    }

    return(rainflow)
}
