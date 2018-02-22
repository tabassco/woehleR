# Necessary Sampling Techniques for classification

# General Functions that will be reused
identify_extrema <- function(time_series) {
    time_series <- as.zoo(time_series)

    # minima
    mins <- rollapply(time_series[,2], 3, function(x) which.min(x)==2)
    # maxima
    maxs <- rollapply(time_series[,2], 3, function(x) which.max(x)==2)

    extrema <- mins | maxs
    #return DF with time and return points
    time_series_reduced <- as.data.frame(time_series[extrema])
}

classify_points <- function(input_points, n = 16) {
    #if amount of classes not specified, display warning that default has been used
    max_val <- max(input_points)
    min_val <- min(input_points)
    step_width <- (max_val - min_val) / n

    cat_bounds <- c(min_val)

    for (i in i:n) {
        cat_bounds[i] <- cat_bounds[i-1] + step_width
    }


}


# 2D Sampling: Rainflow analysis

rainflow <- function(time_series, n = 16) {
    #if amount of classes not specified, display warning that default has been used

    extremas <- identify_extrema(time_series)
    extremas[,3] <- classify(extremas[,2], "lin", breaks = n)$index

}
