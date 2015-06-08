pollutantmean <- function(directory, pollutant, id = 1:332) {
    all = data.frame()
    for (fn in id) {
        pad_id = formatC(fn, width=3, format="d", flag="0")
        base_path = paste(directory, pad_id, sep="/")
        full_path = paste(base_path, "csv", sep=".")
        df = read.csv(full_path)
        all = rbind(df, all)
    }
    mean(all[[pollutant]], na.rm=TRUE)
}