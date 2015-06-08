complete <- function(directory, id = 1:332) {
    res = data.frame(id=numeric(0), nobs=numeric(0))
    for (fn in id) {
        pad_id = formatC(fn, width=3, format="d", flag="0")
        base_path = paste(directory, pad_id, sep="/")
        full_path = paste(base_path, "csv", sep=".")
        df = read.csv(full_path)
        ok = complete.cases(df)
        nobs = sum(ok)
        tmp = data.frame(id=fn, nobs=nobs)
        res = rbind(res, tmp)
        #nobs = nrow(df[complete.cases(df)])
        #
    }
    res
}