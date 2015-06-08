corr <- function(directory, threshold = 0) {
    res = c()
    for (file in list.files(directory, full.names=TRUE)) {
        filename = strsplit(file, "/")[[1]][2]
        id = as.numeric(strsplit(filename, "\\.")[[1]][1])
        nobs = complete(directory, id)[["nobs"]]
        # if no nobs, no point in computing correlation...
        # also `cor` fails if there are no observations
        if (nobs == 0) {
            next
        }
        if (nobs >= threshold) {
            df = read.csv(file)
            res = append(res, cor(df[["sulfate"]], df[["nitrate"]], use="complete.obs"))
        }
    }
    res
}