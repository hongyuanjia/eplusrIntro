library(purrr)

# helper to calculate R value of a material
material_r_value <- function (material) {
    val <- material$value(c("Thickness", "Conductivity"))
    val$Thickness / val$Conductivity
}

# helper to calculate R value of a construction
construction_r_value <- function (construction) {
    mat <- construction$ref_to_object()
    each_r <- map_dbl(mat, material_r_value)
    sum(each_r)
}

# helper to increase or decrease the thickness of insulation layer if necessary
adjust_insulation <- function (insulation, current_r_value, expect_r_value) {
    distance <- expect_r_value - current_r_value
    insulation$Thickness <- distance * insulation$Conductivity + insulation$Thickness
}

align_roof_r_value <- function (idf, expect_r_value = 4) {
    # disable verbose messages
    old <- eplusr_option("verbose_info")
    on.exit(eplusr_option(verbose_info = old), add = TRUE)

    eplusr_option(verbose_info = FALSE)

    # get all surfaces
    surf <- idf$BuildingSurface_Detailed

    # get all roofs
    roof <- keep(surf, ~tolower(.x$Surface_Type) == "roof")

    # get constructions of roofs
    const <- roof %>% map(~.x$ref_to_object("Construction Name")) %>% flatten()

    # get R values of all roofs
    const_r <- const %>% map_dbl(construction_r_value)

    # if there are any construction needed to be modified
    if (any(const_r != expect_r_value)) {

        const_to_modify <- const_r[const_r != expect_r_value]

        # get insulation layer of each construction
        insulation <- map(idf$objects(names(const_to_modify)), ~.x$ref_to_object("Outside Layer")[[1L]])

        # add thickness
        walk2(insulation, const_to_modify, adjust_insulation, expect_r_value = expect_r_value)
    }

    # show final R values
    const %>% map_dbl(construction_r_value)
}
