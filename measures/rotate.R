rotate_building <- function (idf, degree = 0L) {
    if (!idf$is_valid_class("Building")) {
        stop("Input model does not have a Building object")
    }

    if (degree > 360 || degree < -360 ) {
        stop("Input degree should in range [-360, 360]")
    }

    cur <- idf$Building$North_Axis

    new <- cur + degree

    if (new > 360) {
        new <- new %% 360
        warning("Calculated new north axis is greater than 360. Final north axis will be ", new)
    } else if (new < -360) {
        new <- new %% -360
        warning("Calculated new north axis is smaller than -360. Final north axis will be ", new)
    }

    idf$Building$North_Axis <- new

    idf$Building
}

